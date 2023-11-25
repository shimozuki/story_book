import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalWidget extends StatefulWidget {
  const ModalWidget({super.key});

  @override
  State<ModalWidget> createState() => _ModalWidgetState();
}

class _ModalWidgetState extends State<ModalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.73,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        width: 320,
        height: MediaQuery.of(context).size.height * 1.0,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, -10),
              blurRadius: 10,
            ),
          ],
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemDetail?.gambar == null
                      ? Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          padding:
                              const EdgeInsets.fromLTRB(54.5, 44, 54.5, 44),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            color: const Color(0xffe98684),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 181,
                              height: 123,
                              child: Image.asset(
                                'assets/brands/product.png',
                              ),
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          padding:
                              const EdgeInsets.fromLTRB(54.5, 44, 54.5, 44),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                             image:NetworkImage('https://saribuana.shop/storage/app/${itemDetail!.gambar[0]}'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 14.5),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.01,
                                0,
                                MediaQuery.of(context).size.width * 0.11,
                                0),
                            child: Text(
                              itemDetail?.nama ?? '',
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 1.1725,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 24,
                            height: 24,
                            child: Icon(Icons.share_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 14.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 0, maxHeight: 60),
                      child: Stack(
                        children: [
                          Positioned(
                            // choosevariantSZd (175:561)
                            left: 0,
                            top: 0,
                            child: Align(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.height * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: Text(
                                  'Choose Variant',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.171875,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                              0,
                              MediaQuery.of(context).size.height * 0.04,
                              0,
                              0,
                            ),
                            child: SizedBox(
                              height: 29,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: itemDetail?.variant.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  final variants = itemDetail!.variant[index];
                                  // ignore: unnecessary_null_comparison
                                  if (variants == null) {
                                    print(variants.nama);
                                    return SizedBox.shrink();
                                  }
                                  final selected = variants.kdSatuan;
                                  final isFirstVariant = index == 0;

                                  if (isFirstVariant &&
                                      _selectedKdSatuan.isEmpty) {
                                    _selectedKdSatuan = selected;
                                  }
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        isSelected = !isSelected;
                                        _selectedKdSatuan = selected;
                                      });
                                      print(
                                          'selected variant index: $_selectedKdSatuan');
                                    },
                                    child: Container(
                                      child: SizedBox(
                                        width: 100, // sesuaikan lebar variant
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: selected == _selectedKdSatuan
                                                ? const Color(0xffbd212f)
                                                : Colors.grey[300],
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Center(
                                              child: Text(
                                                variants.nama,
                                                style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.1725,
                                                  color: selected ==
                                                          _selectedKdSatuan
                                                      ? const Color(0xffffffff)
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // qty6YF (175:568)
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 14.5),
                    child: Text(
                      'Qty',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.1725,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0, 0, 0, MediaQuery.of(context).size.height * 0.056),
                    padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x33000000)),
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: InputQty(
                      maxVal: 50,
                      initVal: 1,
                      minVal: 0,
                      steps: 1,
                      boxDecoration: BoxDecoration(shape: BoxShape.circle),
                      borderShape: BorderShapeBtn.none,
                      plusBtn: const Icon(Icons.add_circle),
                      minusBtn: const Icon(Icons.remove),
                      btnColor1: Colors.red,
                      btnColor2: Colors.red,
                      onQtyChanged: (val) {
                        _qty = (val as int?)!;
                      },
                    ),
                  ),
                  Container(
                    // frame206MMh (193:6)
                    width: double.infinity,
                    height: 46,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // final userProvider = Provider.of<UserProvider>(
                            //     context,
                            //     listen: false);

                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => SelectTemplate(
                            //       kdBarang: itemDetail!.kdBarang,
                            //       kdSatuan: _selectedKdSatuan,
                            //       qty: _qty!,
                            //       token: userProvider.user!.mobToken,
                            //     ),
                            //   ),
                            // );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  40), // set border radius menjadi setengah dari width/height
                              border: Border.all(
                                  color: Color(0xffbd212f),
                                  width: 2), // set border
                            ),
                            // frame59xbR (175:298)
                            width: 46,
                            height: 46,
                            child: Icon(
                              Icons.save_alt_outlined,
                              color: Color(0xffbd212f),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          // frame592ij (175:579)
                          width: MediaQuery.of(context).size.width * 0.76,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffbd212f),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextButton(
                            onPressed: (){
                              // final userProvider = Provider.of<UserProvider>(
                              //     context,
                              //     listen: false);
                              // final token = userProvider.user?.mobToken;
                              // final kdUser = userProvider.user?.kdUser;
                              // final kdCustomer = userProvider.user?.kdCustomer;

                              // try {
                              //   await addToCart(
                              //     itemDetail!.kdBarang,
                              //     _selectedKdSatuan,
                              //     _qty!,
                              //     kdUser!,
                              //     kdCustomer!,
                              //     token!,
                              //   );

                              //   // Menutup modal

                              //   // Merefresh halaman
                              //   final jml_chart =
                              //       await MyApiService.fetchCartCount(
                              //           token, kdUser);
                              //   if (mounted) {
                              //     setState(() {
                              //       _cartCount = jml_chart;
                              //     });
                              //   }
                              //   Navigator.pop(context);
                              //   Fluttertoast.showToast(
                              //     msg:
                              //         '${itemDetail?.nama ?? ''} successfully added to cart',
                              //     toastLength: Toast.LENGTH_SHORT,
                              //     gravity: ToastGravity.BOTTOM,
                              //     timeInSecForIosWeb: 5,
                              //     backgroundColor: Color.fromARGB(178, 0, 0, 0),
                              //     textColor: Colors.white,
                              //   );
                              // } catch (error) {
                              //   showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return AlertDialog(
                              //         title: Text('Error'),
                              //         content: Text(
                              //             'An error occurred while adding item to cart.'),
                              //         actions: [
                              //           TextButton(
                              //             child: Text('OK'),
                              //             onPressed: () {
                              //               Navigator.pop(context);
                              //             },
                              //           ),
                              //         ],
                              //       );
                              //     },
                              //   );
                              // }
                            },
                            child: Center(
                              child: Text(
                                'Add to Cart',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  height: 1.1725,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}