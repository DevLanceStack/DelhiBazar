import 'dart:convert';

import 'app_logs.dart';
import 'package:http/http.dart' as http;

class RestClient{
  //post method

  static Future postData(String url, {Map<String, String>? headers, Object? body})async{
    //first parameter is url,second is header , third is request body
    var result;  //define variable for response handle
    Log.console('Http.Post url:$url');  // here we use the console function for print log
    if(headers!=null){
      Log.console('Http.Post headers:$headers');
    }
    if(body!=null){
      Log.console('Http.Post body:$body');
    }

    //print all request data like url,headers,body
    //now user try and catch for any type exception catching
    try{
      //first import http for http.dart
      // use await for wait for some time
      http.Response response=await http.post(
        Uri.parse(url), //here parse string as url
        headers: headers, //add headers here
        body: body
      );
      //here we handle response
      result=handleResponse(response); //handleResposene method we create later

      // print log for response
      Log.console("Http.Post Response Code:${response.statusCode}");
      Log.console("Http.Post Response Body:${response.body}");

    }catch(e){
      //here handle error
      // later we implement it , first do try block

      //also print error log
      // handle response in error
      result=handleResponse(); //method we create later

      // here we got error so remove the verible response here in catch block

      // becouse we handel null response in handler

      Log.console('Http.Post Error:$e');
      Log.console('Http.Post response body:$result');
    }
  }


  // response handler
//here we take array as parameter leter will add extra params if need so that
 // we take array
  // user null sefty
  // this function return a response as json
static dynamic handleResponse([http.Response? response]){
    var result;
    // []use try and catch for excaption
    try{
// how here we handle if no exception
    // first check response is null or not
    if(response!=null){
      //now check status code is 200 or not
      if(response.statusCode==200){
        // here we deconde response in json if all things are proper

        // jsonencode mean json to string
        // jsondecode mean string to json
        result=jsonDecode(response.body);
        // decode response body

      }else{
        result={
          'status':false,
          'message':response.reasonPhrase
        };
      }

    }else{
      result={
        'status':false,
        'message':'Unable to connect to server!'
      };

    }

    }catch(e){
      Log.console('Handle Response Error :$e');
      result={
        'status':false,
        'message':'Something went wrong!'
      };
    }

    return result;  // here we return result  back to  where we call
}






}