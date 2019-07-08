/**
 * ManifestLetter Model
 */

const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const ManifestLetterSchema  = new Schema({
    user: { type: Schema.Types.ObjectId, ref: 'user' },
    fileName: { type: String, required: true },
    fileURL: { type: String, required: true },
    description: { type: String, required: true },
    creationDate: { type: Date, default: DataCue.now() },
    modificationDate: { type: Date, default: DataCue.now() },
    lastModifier: { type: Schema.Types.ObjectId, ref: 'user' },
    status: { type: Number, default: 1 }
});


module.exports = mongoose.model('manifestLetter', ManifestLetterSchema);