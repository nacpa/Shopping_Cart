import 'package:get/get.dart';

import '../Controller/CartController.dart';
import 'Item.dart';
var ls=Get.find<CartController>().cart;

List<Item> data = <Item>[
  Item(headerValue: 'Popular Item', expandedValue:ls[0].popularItem ),
  Item(headerValue: 'Salads', expandedValue: ls[0].salad),
  Item(headerValue: 'Chinise', expandedValue: ls[0].chinise),
  Item(headerValue: 'Soup', expandedValue: ls[0].soups),
  Item(headerValue: 'Tandori', expandedValue: ls[0].tandori),
  Item(headerValue: 'South Indian', expandedValue: ls[0].southIndian),
];





String JsonString=''' 
{

"Status":"ok",
"data":[

{
  "Popular Item": [
    {
      "name": "Veg Biryani",
      "price": 99,
      "instock": true
    },
    {
      "name": "Pizza Burger",
      "price": 79,
      "instock": true
    },
    {
      "name":  "Veg Noodles",
      "price": 149,
      "instock": true
    },
    {
      "name": "Paneer Pizza",
      "price": 199,
      "instock": true
    },
    {
      "name": "Malai Chap",
      "price": 179,
      "instock": true
    }
    
  ],

  "Salad": [
    {
      "name": "Green Salad",
      "price": 129,
      "instock": true
    },
    
    {
      "name": "Caesar Salad Supreme",
      "price": 149,
      "instock": true
    },
    {
      "name": "Cobb Salad",
      "price": 199,
      "instock": true
    }
    
  ],
  "Chinise": [
    {
      "name": "Veg Haka Noodles",
      "price": 299,
      "instock": true
    },
    {
      "name": "veg Manchurian",
      "price": 129,
      "instock": true
    },
    {
      "name": "Chinise Starter",
      "price": 259,
      "instock": true
    }
    
  ],

  "Soups": [
    {
      "name": "Hot n Sour",
      "price": 99,
      "instock": true
    },
    {
      "name": "Tomato Soup",
      "price": 69,
      "instock": true
    },
    {
      "name": "Corn Soup",
      "price": 119,
      "instock": true
    },
    {
      "name": "Mushroom Soup",
      "price": 149,
      "instock": true
    },
    
    {
      "name": "Mix Veg Soup",
      "price": 119,
      "instock": true
    }
  ],
  "Tandori": [
    {
      "name": "Plain Tandori Roti",
      "price": 19,
      "instock": true
    },
    {
      "name": "Butter Tandori Roti",
      "price": 23,
      "instock": true
    },
    {
      "name": "Tandoori butter Nan",
      "price": 49,
      "instock": true
    },
    {
      "name": "Tandoori Chai",
      "price": 39,
      "instock": true
    }
 
  ],
  "South Indian": [
    {
      "name": "Plain Dosa",
      "price": 199,
      "instock": true
    },
    {
      "name": "Masala Dosa",
      "price": 249,
      "instock": true
    },
    {
      "name": "Paneer Dosa",
      "price": 299,
      "instock": true
    },
    {
      "name": "Idli with sambhar",
      "price": 199,
      "instock": true
    }
  ]
}

]



}






















''';