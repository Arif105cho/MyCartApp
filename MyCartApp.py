import mysql.connector
from datetime import datetime12

try:
    
    mycur=mysql.connector.connect(host='localhost',
        password='',
        database='MyCartApp',
        user='root'
    )

    cursor = mycur.cursor()


    # this module for admin who can create/add category and prduct
    
    def AddCategory():
        while(1):
            print('Press 1 for add Category')
            print('Press 2 for add Products')
            print('Press 3 for List all AddCart') # admin can see list of all products
            print('press 4 for View all User  bill')
            print('Press 0 exit')
            ch7=input('Enter your choice :')

            if ch7=='1': #this is used for admin to give category
                try:
                        
                    idd=(input('enter category id number :'))
                    name=input('enter category name :')
                    cursor.execute("insert into categories (id,cate_name)values('"+idd+"','"+name+"') ")
                    mycur.commit()
                    print('Category Added in the list..')

                except Exception as e:
                    print('error',e)
                
            elif ch7=='2': # this is used for give product unser category
                idd=(input('enter product id number :'))
                n
                ame=input('enter prduct name :')
                detail=input('Enter detail of product :')
                price=input('Enter the price of product :')
                idc=input('enter the id of category under the product is placed :')
                cursor.execute("insert into productss (id,pro_name,pro_detail,pro_price,cat_id)values('"+idd+"','"+name+"','"+detail+"','"+price+"','"+idc+"') ")
                mycur.commit()
                print('Product is Added under the specified category id')


            elif ch7=='3': # this is used for shows products under user addcart
                cursor.execute("select * from addcart")
                data=cursor.fetchall()
                for i in data:
                    print(i)

            elif ch7=='4': # this is used for shows all bill of user
                cursor.execute("select * from purchase")
                data=cursor.fetchall()
                for i in data:
                    print(i)
            
                
            elif ch7=='0':
                break
            
    # pruducts add in cart by user

    def AddCart():
        ch9=input('enter product id : ')
        cursor.execute("select pro_name, pro_detail, pro_price from productss where id='"+ch9+"'")
        data=cursor.fetchone()
        idd=input('enter customer id :')
        a=data[0]
        b=data[1]
        c=str(data[2])
        cursor.execute("insert into addcart (idd,name,detail,price)values('"+idd+"','"+a+"','"+b+"','"+c+"')")
        mycur.commit()
        print('Prduct add in cart.. successfully..')

    # purchase table for user
    def purchase():
        while(1):
            ch9=input('enter addcard id :')
            cursor.execute("select * from addcart where idd='"+ch9+"'")
            data=cursor.fetchall()
            for i in data:
                print(i)
            a=data[0]
            b=data[1]
            c=data[2]
            d=data[3]
            p=input('enter product id :')
            cursor.execute("select price from addcart where idd='"+p+"'")
            data[0]=cursor.fetchone()

            now=now.datetime.now()
            date = now.strftime("%m/%d/%Y, %H:%M:%S")
           
            
            print(data[0])
            a=(data[0])
            qty=int(input('quantity :'))
            res=a*qty
            print(res)
            if res>10000:
                total_bill=res-500
                print(total_bill)
            else:
                total_bill=res
                print(total_bill)
            
            cursor.execute("insert into purchase (idd,name,detail,price,bill,date)values('"+idd+"','"+a+"','"+b+"','"+c+"','"+d+"','"+total_bill+"','"+date+"')")
            mycur.commit()
            print('Your order is placed thankyou for shoping with us..')
            


            
        
    
            
    

    #this module for category user can see product accoring to category
            
    def category():
        
        cursor.execute("select cate_name from categories")
        data=cursor.fetchall()
        for i in data:
            print(i)
            
        while(1):# category
            print('Press 1 for Electronic poducts')
            print('Press 2 for home goods poducts')
            print('Press 3 for grocery poducts')
            print('Press 0 exit')
            ch4=input('enter your choice :')
            if ch4=='1': # product list under category
                print('Name   Details   Price')
                cursor.execute("select pro_name, pro_detail, pro_price from productss where cat_id=101")
                data=cursor.fetchall()
                for i in data:
                    print(i)
            elif ch4=='2': # product list under category
                print('Name   Details   Price')
                cursor.execute("select  pro_name,pro_detail,pro_price from productss where cat_id=102")
                data=cursor.fetchall()
                for i in data:
                    print(i)
            elif ch4=='3':# product list under category
                print('Name   Details   Price')
                cursor.execute("select pro_name,pro_detail,pro_price from productss where cat_id=103")
                data=cursor.fetchall()
                for i in data:
                    print(i)
 
        
            elif ch4=='0': # after seen products we asked user to add to cart any product 
                ch8=input('Do you want to add the product in Cart press Y/n :'  )
                if ch8=='n':
                    print('thank you for visiting..')
                    break
                if ch8=='y':
                    AddCart()
                break
        
    
        

    # This is SignUp and Sign Module for user
    
    while(1):
        print('Press 1 for User SignUp' )
        print('Press 2 for User SignIn' )
        print('Press 3 for Admin Login' )
        print('Press 0 for Exit' )
    
        ch=input('enter your choice : ')
        
        if ch=='1': # Registreation of User
            
            try:
                user_id=(input('enter user id :'))
                username=input('enter username :')
                passs=input('enter password :')
                mobile=input('enter mobile :')
                email=input('enter your email :')
                cursor.execute("insert into UserDetails (user_id,username,pass,mobile,email)Values('"+user_id+"','"+username+"','"+passs+"','"+mobile+"','"+email+"')")
                mycur.commit()
                print('You Successfully SignUp...')
            except Exception as e:
                print('please try different username might be its already exist..')
                
        elif ch=='2': # login of User
            username=input('enter username :')
            passs=input('enter password :')
            #cursor.execute("SELECT username,pass FROM UserDetails where username='"+username+"' ")
            statement = f"SELECT username,pass from UserDetails  WHERE username='{username}' AND pass = '{passs}';"

            cursor.execute(statement)
            data=cursor.fetchone()
            if not data:
                print('Sorry please Register yourself')
            else:
                print('\n ....Welcome sir....\n')
                while(1):
                    print('Press 1 for Category' )
                    print('Press 2 for Cart' )
                    print('Press 3 for Purchasing products' )
                    print('Press 0 for Exit' )
                    ch5=input('enter your choice :')
                    if ch5=='1':
                        category()
                    if ch5=='2':
                        AddCart()
                    if ch5=='3':
                        purchase()
                    elif ch5!='1' and ch5!='2' and ch5!='3':
                        print('YUo entered invalid Number...')

        # We create Admin Manually beacuse we assume that we have only one Admin/owner/ superuser
        elif ch=='3':
            try:
                    
                us=input('enter username for admin :')
                pas=input('enter password for admin :')
                if us=='admin' and pas=='1234':
                    print('Welcome to Admin')
                    AddCategory()
                else:
                    print('You Are not autherized admin')
            except Exception as e:
                print('Please enter username and passwrod carefully..')

         
        elif ch=='0':
             break
        elif ch!='1' and ch!='0' and ch!='2' and ch!='3':
             print('you entered invalid choice')      
       
            
        
    #print('Database connnectivity done')
    
except Exception as e:
    print(e)
