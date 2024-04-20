function updateImage() {
    var frameID = document.getElementById("yearID").value;
    var directory = document.getElementById("imageToChange").src.substring(0,document.getElementById("imageToChange").src.lastIndexOf("/"));
    var imageName = directory + "/" + frameID + ".png";
    document.getElementById("imageToChange").src = imageName;
}