# -*- coding: utf-8 -*-
"""
Created on Tue Apr 21 21:45:29 2020

@author: Safa Eladib
"""
import requests as r
from bs4 import BeautifulSoup
import pandas as pd

#scrap_home_page('https://www.startupranking.com/top')
def scrap_home_page(url):
    """
        
    This function scrap the home page and get the list of the top 100 URL
    of startups

    
    Parameters
    ----------
    url : string
        home page url.

    Returns
    -------
    list of 100 startup urls.

    """

    resp=r.get(url).content
    soup=BeautifulSoup(resp)
    tabs=soup.find_all('table',{'class':'rank_table'})[0]
    rows=tabs.find_all('tr')
    list_urls=[i.select('a')[0].get('href') for i in rows]
    list_urls.pop(0)
    return list_urls

def get_url_funding_page(url_startup_page):
    """
    This function return the url funding page of a specified startup

    Parameters
    ----------
    url_startup_page : String
        url of a startup page.

    Returns
    -------
    TYPE
        the url funding page .

    """
    resp=r.get(url_startup_page).content
    soup=BeautifulSoup(resp)
    print('url startup page\n\n\n',url_startup_page)
    tabb = soup.select('.small-table-container')[1].select('a.see-all')
    if len(tabb)==0: 
        return ''
    else:
        return tabb[0].get('href')
    
    
#get_url_funding_page('https://www.startupranking.com/telegram')   
    
    

def scrap_startup_page(url_startup,it,total_funding_amount):
    """
    This function scrap the startup page 

    Parameters
    ----------
    url_startup : String
        url startup
    it : integer
        iteration number to build the index of row of the dataframe .
    total_funding_amount : TYPE
        the total funding amount.

    Returns
    -------
    df : pandas datafame
        row of dataframe.

    """
    resp2=r.get(url_startup).content
    soup2=BeautifulSoup(resp2)
    description = soup2.select('div.su-info p')[0].text.strip()
    name=soup2.select('div.su-info h2 a')[0].text
    # founded date
    tabb = soup2.select('div.su-info p.su-loc')
    if len(tabb)==0: 
        founded_date = ''
    else:
        founded_date =  tabb[0].text.strip()
    
    # category_list
    cat = soup2.select('div.su-tags.group ul li')
    category_list =[i.text for i in cat]
    category_string = ','.join(category_list)

    dict_info={'name':name,'description':description,'founded_date':founded_date,'category_list': category_string,'total_funding_amout':total_funding_amount}
    df=pd.DataFrame(dict_info,index=[it])
    return df

#scrap_startup_page('https://www.startupranking.com/stores',0,210100000)



import re
def get_total_funding_amount(url_funding_page):
    """
    This function calculate the total funding amount

    Parameters
    ----------
    url_funding_page : String
        the url funding page.

    Returns
    -------
    Totalfunding_amount : integer
        the total funding amount.

    """
    if url_funding_page=='':
        return 0
    else:
        resp=r.get(url_funding_page).content
        soup=BeautifulSoup(resp)
        tabs2 = soup.select('.ranks')[0]
        rows2=tabs2.find_all('tr')
        list_funding_amount = [i.select('span')[0].text for i in rows2]
        list_funding_amount = list(filter(lambda a: a != 'Undisclosed amount', list_funding_amount))
        funding_amount_dolar = [int(re.search(r'[0-9]+',i.replace(',','')).group(0)) for i in list_funding_amount]
        Total_funding_amount = sum(funding_amount_dolar)
        return Total_funding_amount
    
    

#get_total_funding_amount('https://www.startupranking.com/startup/freelancer/funding-rounds')
        
    
    
    
import pymysql

def save_to_sql(data):
    """
    

    Parameters
    ----------
    data : dataframe 
        The dataframe to store into the mysql database.

    Returns
    -------
    None.

    """
    connection = pymysql.connect(host='localhost',
                             user='root',
                             password='safa',
                             db='startupdb')
    cursor = connection.cursor()
    # creating column list for insertion
    cols = "`,`".join([str(i) for i in data.columns.tolist()])

    # Insert DataFrame recrds one by one.
    for i,row in data.iterrows():
        sql = "INSERT INTO `startup` (`" +cols + "`) VALUES (" + "%s,"*(len(row)-1) + "%s)"
        cursor.execute(sql, tuple(row))

        # the connection is not autocommitted by default, so we must commit to save our changes
        connection.commit()


import time
url = 'https://www.startupranking.com/top'
url_home = 'https://www.startupranking.com'
#https://www.startupranking.com/top/0/2
list_urls = scrap_home_page(url)


def scrap_all_startup_perpage(url_home,list_urls):
    """
    

    Parameters
    ----------
    url_home : String
        Home page url.
    list_urls : list of strings
        List of 100 startup urls.

    Returns
    -------
    dataframe : dataframe 
        Big dataframe reprensenting all startups .

    """
    
  
    dataframe = pd.DataFrame()
    i=0
    for url_startup in list_urls:
        i+=1
        whole_url_startup = url_home + url_startup    
        url_funding = get_url_funding_page(whole_url_startup)
        if url_funding=='':
            whole_url_funding = ''
        else:
            whole_url_funding = url_home + url_funding

        total = get_total_funding_amount(whole_url_funding)
        new_df = scrap_startup_page(whole_url_startup,i,total)
        print(new_df)
        dataframe = dataframe.append(new_df)
        time.sleep(1)
        # saving each 10 startup into the mysql table
        if i%10==0:
            pos = i-10
            df = dataframe.iloc[pos:i]
            save_to_sql(df)
    
    return dataframe
    
    

#dataframe = scrap_all_startup_perpage(url_home,list_urls)
#dataframe.to_csv('startup.csv')




if __name__=='__main__':
    dataframe = pd.DataFrame()
    list_urls = scrap_home_page('https://www.startupranking.com/top')
    dataframe = scrap_all_startup_perpage('https://www.startupranking.com',list_urls) 
    dataframe.to_csv('startup.csv')