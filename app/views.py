# -*- encoding: utf-8 -*-
"""
License: MIT
Copyright (c) 2019 - present AppSeed.us
"""
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
import json
from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from app.Serializer import *
from app.helper import *
from django.http import HttpResponse
from django.shortcuts import redirect
from rest_framework import status
@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def home(request):
    result = []
    result1 = []
    extras1 = []
    extras2 = []
    result, result1 = collectPizza(result, result1)
    extras1, extras2 = collectExtras(extras1,extras2)
    context = {"pizza1": result, "pizza2": result1,
               "wings_klein":collectWings('wings_klein'),"wings_gross":collectWings('wings_gross'),
               "pasta": collectWings('pasta'), "salat": collectWings('salat'), "extras1":extras1,
               "extras2": extras2}
    return render(request, 'productType/productTypes.html', context)

@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def show_atc(request, pk):
    request.session.modified=True
    product = Product.objects.get(pk=pk)

    checkboxes = ''
    if 'pizza' in product.productType:
        extras = Extras.objects.all()
        checkboxes = "<table class='table table-sm'><tbody><tr><th scope='row' colspan='2' style='border:none;' >Add extra</th></tr>"
        i = 0
        while i < len(extras):
            unitPrice = extras[i].unitPrice
            str1=''
            str2=''
            str3 =''
            if unitPrice>1.0:
                str1=f"({unitPrice} Fr)"

            if extras[i+1].unitPrice > 1.0:
                str2 = f"({extras[i+1].unitPrice} Fr)"

            if extras[i+2].unitPrice > 1.0:
                str3 = f"({extras[i+2].unitPrice} Fr)"

            checkboxes += f"<tr><td><input name='add_extra_{extras[i].id}' value='{extras[i].unitPrice}' type='checkbox'> {extras[i].name} {str1}</td>" \
                          f"<td><input name='add_extra_{extras[i + 1].id}' value='{extras[i+1].unitPrice}' type='checkbox'> {extras[i + 1].name} {str2}</td>" \
                          f"<td><input name='add_extra_{extras[i + 2].id}' value='{extras[i+2].unitPrice}' type='checkbox'> {extras[i + 2].name} {str3}</td></tr>"
            i += 3
        checkboxes += "</tbody></table>"

    response=f'''
<div class="modal-body">
	<table class="table table-sm" style='background:#f2f2f2;font-size:16px;'>
        <input type='hidden' name='id' value='{product.id}'></input>
		<tbody>
            <tr>
				<th scope="row">Product Type</th><td>{product.productType}</td>
			</tr>
			<tr>
				<th scope="row">Product Name</th><td>{product.name}</td>
			</tr>
			<tr>
				<th scope="row">Unit Price</th><td><span id='unitPrice'>{product.unitPrice}</span> CHF</td>
			</tr>
            <tr><td colspan="2">{checkboxes}</td></tr>
            <tr>
				<th scope="row">Extra Price</th><td style='text-align:right'><input type='text' style='width:45px;' name='extra_price' readonly value='0.0' id='extra_price'> CHF</td>
			</tr>
            <tr>
				<th scope="row">Extras</th><td style='text-align:right'><input type='text' style='width:25px;' name='total_options' readonly value='0' id='total_options'></td>
			</tr>
			<tr>
				<th scope="row">Quantity</th>
				<td style='text-align:right'>
					<select name='no_of_items' id='no_of_items'>
                        <option value='1' default>1</option>
                        <option value='2'>2</option><option value='3' >3</option><option value='4'>4</option>                        
                    </select>
				</td>
			</tr>
			<tr>
				<th scope="row">Total Price</th><td style='text-align:right'> ( ({product.unitPrice} + <span id='e_price'>0.0</span> ) x <span id='changed_items'>1</span>) = 
                <input type='text' style='width:55px;' name='changed_total' readonly id='changed_total' value='{(product.unitPrice*1)}'> CHF</td>
			</tr>
            <tr>
				<th scope="row">User Input</th><td><textarea name='user_input' style='width:100%;'></textarea></td>
			</tr>
		</tbody>
	</table>
</div>'''
    return HttpResponse(response)

def addToSession(request):
    id = int (request.POST.get('id'))
    product = Product.objects.get(pk=id)
    productSerializer = ProductSerializer(product)
    user_input = request.POST.get('user_input')
    print(f"user input {user_input}")
    total_options = int( request.POST.get('total_options'))
    extra_price = float(request.POST.get('extra_price'))
    no_of_items = int(request.POST.get('no_of_items'))
    changed_total = float(request.POST.get('changed_total'))
    keys=request.POST
    extrasList=[]
    for key in keys:
        if "add_extra_" in key:
            key=int(key.replace("add_extra_",""))
            extras=Extras.objects.get(pk=key)
            extraSerializer = ExtrasSerializer(extras)
            extrasList.append(extraSerializer.data)

    return {"product": productSerializer.data, "no_of_items": no_of_items,
            "total_options":total_options,"extra_price":extra_price,
            "changed_total": changed_total,"extrasList":extrasList,"user_input":user_input}

@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def atc(request):
    result=[]
    if request.session.get('orderItemList') is None:
        row=addToSession(request)
        result.append(row)
    else:
        result = request.session['orderItemList']
        row = addToSession(request)
        result.append(row)
    request.session['orderItemList'] = result
    return redirect('/')

def getExtrasString(extrasList, extra_price):
    extrasString = ''
    rowNo = 1
    if len(extrasList) > 0:
        extrasString = "<ul class ='list-group'>"
        for row in extrasList:
            if row['unitPrice'] == 0:
                extrasString += f"<li class='list-group-item list-group-item-light py-0'><small> {rowNo}.{row['name']} </small> </li>"
            else:
                extrasString += f"<li class='list-group-item list-group-item-light py-0'><small> {rowNo}.{row['name']}    {row['unitPrice']}</small> </li>"
            rowNo += 1
        extrasString += f"<li class ='list-group-item list-group-item-light py-0'><strong>Price   {extra_price} CHF</strong></li></ul>"
    return extrasString


def prepareExtrasListString(extrasList, extraPrice):
    extrasString = ''
    rowNo = 1
    if len(extrasList) > 0:
        extrasString = "<ul class ='list-group'>"
        for row in extrasList:
            extras = Extras.objects.get(pk=row.extras_id)
            if extras.unitPrice == 0:
                extrasString += f"<li class='list-group-item list-group-item-light py-0'><small> {rowNo}.{extras.name} </small> </li>"
            else:
                extrasString += f"<li class='list-group-item list-group-item-light py-0'><small> {rowNo}.{extras.name}    {extras.unitPrice}</small> </li>"
            rowNo += 1
        extrasString += f"<li class ='list-group-item list-group-item-light py-0'><strong>Price   {extraPrice} CHF</strong></li></ul>"
    return extrasString


@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def checkout(request):
    orderItemkList=request.session.get('orderItemList')
    list=[]
    count=1
    totalNoOfItems=0
    changed_total=0
    price=0
    for orderItem in orderItemkList:
        product = orderItem['product']
        no_of_items = orderItem['no_of_items']
        total_options = orderItem['total_options']
        extra_price = orderItem['extra_price']
        changed_total = orderItem['changed_total']
        extrasList = orderItem['extrasList']
        user_input = orderItem['user_input']
        extrasString=getExtrasString(extrasList, extra_price)
        list.append({"s_no":count,"product":product,"no_of_items":no_of_items,"total_options":total_options,"extra_price":extra_price, "changed_total": changed_total,"extrasString":extrasString, "user_input":user_input})
        count+=1
        totalNoOfItems+=no_of_items
        price+=changed_total

    context={"list":list, "totalNoOfItems":totalNoOfItems, "price":price}
    return render(request, 'order/checkout.html', context)


@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def confirm_order(request):
    # list the order items and create object for order item
    customer_nick_name=request.POST.get("customer_nick_name")
    deliveryType = request.POST['deliveryType']
    payMethod = request.POST['paymentMethod']
    orderItemList = request.session.get('orderItemList')
    print(f"customer nick name {customer_nick_name} delivery type {deliveryType} and pay method {payMethod} and total no of products {len(orderItemList)}")

    totalNoOfItems = 0
    price = 0


    order = Order(customer_nick_name=customer_nick_name,paymentStatus='Unpaid', deliveryType=deliveryType, paymentMethod=payMethod,status="New",type="Direct")
    Order.save(order)
    count=1
    for orderItem in orderItemList:
        seq_no=int(count)

        product = orderItem['product']
        no_of_items = orderItem['no_of_items']
        total_options = orderItem['total_options']
        extra_price = orderItem['extra_price']
        changed_total = orderItem['changed_total']
        extrasList = orderItem['extrasList']
        user_input = orderItem['user_input']

        orderItem = OrderItem(seqNo=seq_no,order_id=order.id,product_id=product['id'],
                              noOfItems=no_of_items,unitPrice=product['unitPrice'],totalPrice=changed_total,
                              extrasPrice=extra_price, userInput=user_input)
        OrderItem.save(orderItem)
        extrasNo=1
        for extras in extrasList:
            extras=Extras.objects.get(pk=extras['id'])
            orderItemExtras = OrderItemExtras(seqNo=extrasNo,orderItem_id=orderItem.id,extras_id=extras.id)
            OrderItemExtras.save(orderItemExtras)
            extrasNo += 1

        count+=1
        totalNoOfItems += no_of_items
        price += changed_total

    order.totalPrice=price
    order.total_no_of_items=totalNoOfItems
    Order.save(order)

    request.session['orderItemList'] = None
    return redirect(f'/view_order/{order.id}')



@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def view_order(request, pk):
    # list the order items and create object for order item
    list=[]
    order = Order.objects.get(pk=pk)
    orderItemList=OrderItem.objects.filter(order_id=order.id)
    for orderItem in orderItemList:
        product = Product.objects.get(pk=orderItem.product.id)
        extrasList = OrderItemExtras.objects.filter(orderItem_id=orderItem.id)
        list.append({"orderItem":orderItem,"extrasListString":prepareExtrasListString(extrasList, orderItem.extrasPrice),"product":product,})
    context = {"list": list, "order": order}
    return render(request, 'order/confirmedOrder.html', context)


@api_view(['GET'])
def orders(request):
    list = Order.objects.all()
    context = {"orderList": list}
    return render(request, 'order/all.html', context)


@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def single_order(request, pk):
    list=[]
    order = Order.objects.get(pk=pk)
    orderItems = OrderItem.objects.filter(order_id=order.id)
    for orderItem in orderItems:
        product = Product.objects.get(pk=orderItem.product_id)

        list.append({"orderItem":orderItem,"product":product})
    context={"order":order, "list":list, "orderStatusValues":getOrderStatusValue(order)}
    return render(request, 'order/single.html', context)


orderStatusValues=["New","Progress","Ready","Delivered","Cancelled"]

def getOrderStatusValue(order):
    response = ''
    for row in orderStatusValues:

        if row == order.status:
            response = response + '<label class="btn btn-info btn-sm active"><input autocomplete="off" checked id="' + order.status + '" name="status" type="radio"> ' + order.status + '</label>'
        else:
            response = response + '<label class="btn btn-outline-info btn-sm"><input autocomplete="off" id="' + row + '" name="status" type="radio">' + row + '</label>'

    return response


@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def updateOrderStatus(request):
    if request.body:
        json_data = json.loads(request.body)
        order = Order.objects.get(pk=int(json_data['id']))
        newstatus = json_data['status']
        print(f"order status changed to {newstatus}")
        order.status=newstatus
        Order.save(order)
        return Response(getOrderStatusValue(order), status=status.HTTP_200_OK)

@api_view(['GET'])
# @permission_classes([IsAuthenticated])
def updateOrderStatusAsPaid(request, pk):
    order = Order.objects.get(pk=pk)
    order.paymentStatus='Paid'
    Order.save(order)
    return Response(order.paymentStatus, status=status.HTTP_200_OK)
