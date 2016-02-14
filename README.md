# HatenaBookmarkAPITest

A test project for Hatena OAuth

1. Get your own consumer key and consumer secret for Hatena OAuth.
See [Consumer key を取得して OAuth 開発をはじめよう - Hatena Developer Center](http://developer.hatena.ne.jp/ja/documents/auth/apis/oauth/consumer)
2. Clone me
3. Open ``HatenaBookmarkAPITest.xcworkspace`` by Xcode
4. Build and run this project
5. Get the following **problem**

## My problem

I get the following OAuth problem ``token_rejected`` when getting access token:
```
HTTP Status 401: Unauthorized, Response: oauth_problem=token_rejected
```

I do not know why the token rejected.


## Info

- I use [OAuthSwift](https://github.com/OAuthSwift/OAuthSwift)
- I set "http://www.hatena.ne.jp" as callback URL
- I set ``scope``, which is required by hatena OAuth, to ``requestTokenUrl`` as "https://www.hatena.com/oauth/initiate?scope=read_public,write_public" (It seems to work.)
- A ruby Sinatra-based script written in http://developer.hatena.ne.jp/ja/documents/auth/apis/oauth/consumer has no problem

