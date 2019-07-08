/**
 * Products Catalog Model
 */

const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const ProductsSchema  = new Schema({
    
});


module.exports = mongoose.model('product', ProductsSchema);