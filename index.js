const express = require('express')
const request = require('request')
const bodyParser = require('body-parser')
const app = express()
const fs = require('fs')
console.log('test')
require('dotenv').config()

const api_key = process.env.API_KEY 
const PORT = process.env.PORT || 1331
var places
fs.readFile('places.json',(err,data)=>{
    places = JSON.parse(data)
    places.forEach((p)=>{
        p.name=p.name.charAt(0).toUpperCase()+p.name.slice(1)
    })
})


app.use(express.static('public'))
app.use(bodyParser.urlencoded({extended:true}))
app.set('view engine','ejs')

app.get('/',(req,res)=>{
    var j = JSON.stringify(places)
    
    res.render('index',{places:j})
})

const threshold = 0.01
app.get('/city',(req,res)=>{
    let name = req.query.name
            
    let url = `http://api.openweathermap.org/data/2.5/weather?q=${name}&units=metric&appid=${api_key}`

    request(url,(err,response,body)=>{
        if (err){
            res.send('error')
        }else{
            let weather = JSON.parse(body)
            if (weather.main==undefined){
                res.send('not found')
            }else{
                res.send(weather)
            }
        }
    })
    
    
    // res.end()
})

async function get_city_weather(city){

    let url = `http://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=${api_key}`

    request(url,(err,res,body)=>{
        console.log(res)
        if (err){
            return "error"
        }else{
            let weather = JSON.parse(body)
            console.log(weather)
            return weather

            if (weather.main==null){
                res.render('index',{weather:null,error:"Error"})
            }else{
                let place = `${weather.name}, ${weather.sys.country}`
                let timezone = `${new Date(weather.dt - weather.timezone)}`
            }
        }

    })
}



app.listen(PORT,()=>{
    console.log('now listening on',PORT)
})
