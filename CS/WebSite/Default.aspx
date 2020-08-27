<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to display a group summary value aligned to the right on a group row</title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
			GridViewID="grid">
			<Styles>
				<GroupRow HorizontalAlign="Right">
				</GroupRow>
			</Styles>
		</dx:ASPxGridViewExporter>
		<dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False"
			DataSourceID="dsProducts" KeyFieldName="ProductID">
			<GroupSummary>
				<dx:ASPxSummaryItem FieldName="UnitsInStock" SummaryType="Sum" />
			</GroupSummary>
			<Columns>				
				<dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="0">
					<EditFormSettings Visible="False" />
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataComboBoxColumn FieldName="CategoryID" GroupIndex="0" SortIndex="0"
					SortOrder="Ascending" VisibleIndex="2">					
					<PropertiesComboBox DataSourceID="dsCategories" TextField="CategoryName" ValueField="CategoryID"
						ValueType="System.Int32">
					</PropertiesComboBox>
				</dx:GridViewDataComboBoxColumn>
				<dx:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="3">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="5">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="6">
				</dx:GridViewDataTextColumn>
			</Columns>
			<Settings ShowGroupPanel="True" ShowGroupFooter="VisibleAlways" />
			<Styles>
				<EditForm BackColor="Red" CssClass="myCustomClass">
					<Paddings PaddingBottom="110px" />
				</EditForm>
				<EditFormTable CssClass="customEditTable">
				</EditFormTable>
			</Styles>
			<Templates>
				<GroupRowContent>
					<table style="width: 100%">
						<tr>
							<td>
								<%# Container.GroupText %>
							</td>
							<td align="right">
								Summary:
								<%# Container.SummaryText%>
							</td>
						</tr>
					</table>
				</GroupRowContent>
			</Templates>
		</dx:ASPxGridView>
		<asp:SqlDataSource ID="dsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
			SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Alphabetical list of products]">
		</asp:SqlDataSource>
		<asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
			SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
	</div>	
	</form>
</body>
</html>
