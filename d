[33mcommit 6128730fea69ca9b038b091e7d6772986f348fba[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m, [m[1;31mheroku/master[m[33m)[m
Author: francis <u3096928@uni.canberra.edu.au>
Date:   Thu Sep 30 14:42:32 2021 +1000

    some changes

[1mdiff --git a/.env b/.env[m
[1mindex ffec825..9cfa853 100644[m
[1m--- a/.env[m
[1m+++ b/.env[m
[36m@@ -1,2 +1 @@[m
[31m-API_KEY = 48b551f3219542775f26e2a9cf42b297[m
[31m-PORT = 1331[m
\ No newline at end of file[m
[32m+[m[32mAPI_KEY = 48b551f3219542775f26e2a9cf42b297[m
\ No newline at end of file[m
[1mdiff --git a/Procfile b/Procfile[m
[1mnew file mode 100644[m
[1mindex 0000000..61ddfee[m
[1m--- /dev/null[m
[1m+++ b/Procfile[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32mweb: index.js[m[41m [m
[1mdiff --git a/index.js b/index.js[m
[1mindex 8a6b9c9..eff040c 100644[m
[1m--- a/index.js[m
[1m+++ b/index.js[m
[36m@@ -6,7 +6,8 @@[m [mconst fs = require('fs')[m
 [m
 require('dotenv').config()[m
 [m
[31m-const api_key = process.env.API_KEY[m
[32m+[m[32mconst api_key = process.env.API_KEY || '48b551f3219542775f26e2a9cf42b297'[m
[32m+[m[32mconst PORT = process.env.PORT || 1331[m
 var places[m
 fs.readFile('places.json',(err,data)=>{[m
     places = JSON.parse(data)[m
[36m@@ -75,6 +76,6 @@[m [masync function get_city_weather(city){[m
 [m
 [m
 [m
[31m-app.listen(process.env.PORT,()=>{[m
[31m-    console.log('now listening on',process.env.PORT)[m
[32m+[m[32mapp.listen(PORT,()=>{[m
[32m+[m[32m    console.log('now listening on',PORT)[m
 })[m
\ No newline at end of file[m
