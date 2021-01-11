# pagination-n-gridview
https://www.c-sharpcorner.com/UploadFile/rohatash/gridview-paging-sample-in-Asp-Net/


Here, I will explain how to show a GridView with various types of paging in ASP.NET. We use C# code to bind the SQL data with a GridView control and use the following simple steps to make your ASP.NET GridView control with paging enabled. The GridView control provides you with an easy way to display the number of items on a page without taking much space, with the help of paging. First we create a SQL Server database table.

Creating Table in SQL Server Database

Now create a table named Userinfo with columns UserID, UserName and Country. Set the identity property=true for UserID. The table looks as below.
image1.gif

Now insert data into the table.
image10.gif
First of all drag the GridView control from the Data controls menu. It will add the GridView control's HTML source code as given above.

<asp:GridView ID="GridView2" runat="server">  
</asp:GridView>  
Now add the following namespace.

using System.Data.SqlClient;  
using System.Data;  
Now write the connection string to connect to the database.

string strConnection = "Data Source=.; uid=sa; pwd=wintellect;database=Rohatash;";  
 

Now double-click on the page and write the following code for binding the data with the GridView.

protected void Page_Load(object sender, EventArgs e) {  
    BindData();  
}  
protected void BindData() {  
    string strConnection = "Data Source=.; uid=sa; pwd=wintellect;database=Rohatash;";  
    SqlConnection con = new SqlConnection(strConnection);  
    con.Open();  
    SqlCommand cmd = new SqlCommand("select * from Userinfo", con);  
    DataSet ds = new DataSet();  
    SqlDataAdapter da = new SqlDataAdapter(cmd);  
    da.Fill(ds);  
    GridView1.DataSource = ds;  
    GridView1.DataBind();  
    con.Close();  
}  
Implement PageIndexChanged

Once the event PageIndexChanging is executed, the event will be fired for PageIndexChanged paging. In this event, you can safely bind the grid again to access the second page. It is always preferable to cache the data used to bind the data source.

protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e) {  
    GridView1.PageIndex = e.NewPageIndex;  
    BindData();  
}  
There are four types of paging mode styles available in GridView. The following are the names of the types of paging mode styles.

NumericFirstLast
Numeric
NextPrevious
NextPreviousFirstLast
Now click on the GridView control to load the control properties at the right side panel; press F4 and set the following properties of the GridView.

EnablePaging

EnablePaging property to True to get GridView Paging.

PageSize

Number of rows from the data source to display per page.

NumericFirstLast

Now our GridView is ready with data and I will explain how to use each paging option in our GridView. If you observe the code above I have set the PagerSetting property for the GridView. Click on the GridView control and press F4 and set the following properties.

image2.gif
<PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last"/>  
 

Mode 

This is display type of paging to use.

PageButtonCount 

To display number of pages in the paging.

FirstPageText 

This will display text on the first page Button.

LastPageText 

This will display text on the last page Button.

Now run the application and test it.

image3.gif
Now click on the last Button.

image4.gif

Numeric

By default we will get this numeric paging; once we set AllowPaging and PageSize properties in the GridView to set this property to our GridView write the PagerSetting property like this.

<PagerSettings Mode="Numeric" PageButtonCount="4" />  
 

Now run the application and test it.

image5.gif
NextPrevious

If we want to use this mode for paging in GridView we need to change the PagerSettings mode like this.

NextPageText 

NextPageText property is used for he next page Button.

PreviousPageText 

PreviousPageText property is used for he next page Button.

image6.gif

<PagerSettings Mode="NextPrevious" NextPageText="Next"PreviousPageText="Previous" />  
Now run the application and test it.

image7.gif
NextPreviousFirstLast

If we want to use this mode for paging in GridView we need to change the PagerSettings mode like this.

image8.gif 

<PagerSettings FirstPageText="First" LastPageText="Last"Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />  
Now run the application and test it.

image9.gif

Some Helpful Resources

GridView nested inside another GridView in ASP.NET
ASP.Net AJAX GridView Loading using C#
DynamicField class used by GridView to display data fields that use .NET Dynamic Data features
GridView Formatting
