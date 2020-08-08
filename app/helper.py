from django.shortcuts import render
from rest_framework.decorators import api_view

from app.Serializer import *

def collectPizza(result, result1):
    list = Product.objects.filter(productType='pizza_30cm')

    count = 1
    for product30 in list:

        product40 = Product.objects.filter(productType='pizza_40cm', seqNo=product30.seqNo)
        if len(product40) == 1:
            product40 = product40[0]
            # print(product40)
            # print(f"40 cm pizza name {product40.name}")
            if count < 19:
                result.append({"seqNo": product30.seqNo, "name": product30.name, "product30_id": product30.id,
                               "description": product30.description, "price_30": product30.unitPrice,
                               "price_40": product40.unitPrice, "product40_id": product40.id})
            else:
                result1.append({"seqNo": product30.seqNo, "name": product30.name, "product30_id": product30.id,
                                "description": product30.description, "price_30": product30.unitPrice,
                                "price_40": product40.unitPrice, "product40_id": product40.id})
            count += 1
    return result, result1

def collectWings(productType):
    list = Product.objects.filter(productType=productType)
    return list
def collectExtras(extras1, extras2):
    list = Extras.objects.all()
    count=1
    for row in list:
        if count>15:
            extras2.append(row)
        else:
            extras1.append(row)
        count+=1
    return extras1,extras2