# ecommerce

export PATH="$PATH:/Users/mac/Documents/flutter/bin"

# shopping use total price count
num get totalPrice => items.fold(0, (total, current) => total + current.price);

# Image select camera
final _picker = ImagePicker();
File? image;
PickedFile? image = await _picker.getImage(
    source: ImageSource.camera,
    maxHeight: 675,
    maxWidth: 960,
  );
  File selectedImage = File(image!.path);

  setState(() {
    this.image = selectedImage;
  });
}

# STRIPE PAYMENT GETWAY
static String getStripePrice(double price) {
   final returnedPrice = (price * 100).toInt();
   return returnedPrice.toString();
}

Container(
      height: double.infinity,
      child: Align(
        widthFactor: 0.7,
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ProfileAvatar(colorBg: color1, currentSociety: currentSociety, colorLight: color2))))

FractionallySizedBox(
        widthFactor: 1,
        child: Card(
          elevation: 0,
          margin: margin,
          clipBehavior: Clip.antiAlias,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius) ),
          child: Container(
            height: height,
            color: color
          )))

List<> dataList = List<>.empty(growable: true);