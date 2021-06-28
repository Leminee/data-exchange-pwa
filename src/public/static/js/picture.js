const captureVideoBtn = document.querySelector('.capture-button');
const screenshotBtn = document.querySelector('#screenshot-button');
const img = document.querySelector('#screenshot img');
const video = document.querySelector('#screenshot video');
const canvas = document.createElement('canvas');

//Start Capturing
captureVideoBtn.onclick = function() {
    navigator.mediaDevices.getUserMedia({ video: true })
        .then(stream => {
            video.srcObject = stream;
        }).catch(err => {
            console.log(err);
        });
};

screenshotBtn.onclick = function() {
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;

    //draw image
    canvas.getContext('2d').drawImage(video, 0, 0);

    //create dataUrl
    let dataUrl = canvas.toDataURL('image/png');
    img.src = dataUrl;

    //download the image#
    var hrefElement = document.createElement('a');
    hrefElement.href = dataUrl;
    document.body.append(hrefElement);
    hrefElement.download = `Screenshot$.png`; //download name
    hrefElement.click();
    hrefElement.remove();
};




