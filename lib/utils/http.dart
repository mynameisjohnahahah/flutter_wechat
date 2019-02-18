import 'package:dio/dio.dart';

class Http{
  static Http instance;
  static String token;
  static Dio _dio;
  Options _options;

  static Http getInstance(){
    print("getInstance");
    if(instance == null){
      instance  = new Http();
    }
  }

  Http(){
  		// 初始化 Options
    _options = new Options(
      baseUrl: "https://geffoliu.cn",
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {}
    );

    _dio = new Dio(_options);
		
	  //发送请求拦截处理，例如：添加token使用
    _dio.interceptor.request.onSend = (Options options) async{
      // print(options.baseUrl);
      return options;
    };
	
	//请求成功拦截，简化代码中调用难度
    _dio.interceptor.response.onSuccess = (Response response) async{
      // print(response.statusCode);
      return response;
    };
		//请求失败拦截
    _dio.interceptor.response.onError = (DioError e) {
      print(e);
      return e;
    };
  }

   // get 请求封装
  get(url,{ options, cancelToken, data=null}) async {
    Response response;
    try{
      response = await _dio.get(
          url,
          data:data,
          cancelToken:cancelToken
      );
    }on DioError catch(e){
      if(CancelToken.isCancel(e)){
        print('get请求取消! ' + e.message);
      }else{
        print('get请求发生错误：$e');
      }
    }
    return response.data;
  }
	
	// post请求封装
  post(url,{ options, cancelToken, data=null}) async {
    Response response;

    try{
      response = await _dio.post(
          url,
          data:data !=null ? data : {},
          cancelToken:cancelToken
      );
      print(response);
    }on DioError catch(e){
      if(CancelToken.isCancel(e)){
        print('get请求取消! ' + e.message);
      }else{
        print('get请求发生错误：$e');
      }
    }
    return response.data;
  }
}