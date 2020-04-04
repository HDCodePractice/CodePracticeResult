let phoneTotalStorage = 128
let phoneTotalStorageUsed = 39
let phoneTotalStorageLeft = phoneTotalStorage-phoneTotalStorageUsed
let timeOfVideosLeft =  Int(phoneTotalStorageLeft*1000/150)
show("Your phone has \(phoneTotalStorage) GB\nYou already used \(phoneTotalStorageUsed) GB\nYour phone has \(phoneTotalStorageLeft) GB left\nYou can still film \(timeOfVideosLeft) minutes of videos")
