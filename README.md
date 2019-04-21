# rpay &middot;
An SAAS application with the purpose to emit invoice stamps in Mexico (2019).



### Prerequisites

What things you need to install the software and how to install them

```
1. Linux Server Ubuntu 16.04
2. MySQL 
3. 
```

### Installing

A step by step series of examples that tell you how to get a development env running

```
$ git clone https://github.com/cvaldezissc/rpay.git
$ cd rpay

#=====================================================================
# This is for you to introduce your own configurations
#=====================================================================
$ cp config/default_example.json config/default.json
$ nano config/default.json

$ npm install
$ node index.js
```



## Issues and new features

If you found a new issue please report it to [Project Issues](https://github.com/cvaldezissc/rpay/issues/new). 

And if you want to add a new feature, please feel free to make a PR with this template [PR Template](https://github.com/cvaldezissc/rpay/tree/master/docs/PR_TEMPLATE.md)




## Built With

* [Node JS](https://nodejs.org/download/release/v8.11.4/) - NodeJS v8.11.4
* [NPM](https://stackoverflow.com/a/44880273/6604217) - NPM v5.6.0
* [Mongo DB](https://docs.mongodb.com/manual/release-notes/4.0/?_ga=2.253379082.2041295965.1539547053-272326873.1539547053#download) - MongoDB v4.0.3



## To Do List
- [ ] Finish Database main structure (from scratch).
- [ ] Make Entity-Relationship diagram
- [ ] Make Documentation of each DB field
- [ ] Test all Procedures into the main DB
- [ ] Backend
- [ ] Frontend 


## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [Tags](https://github.com/cvaldezissc/mn-trustmatic/tags). 


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.