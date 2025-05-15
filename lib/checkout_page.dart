import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final List<Map<String, dynamic>> items = [
    {'name': 'Permen', 'qty': 4, 'price': 1000},
    {'name': 'Teh', 'qty': 2, 'price': 2500},
    {'name': 'Pensil', 'qty': 1, 'price': 500},
  ];

  @override
  Widget build(BuildContext context) {
    int total = 44500;
    int paid = 50000;
    int change = paid - total;

    return Scaffold(
      appBar: AppBar(title: const Text('Struk Belanja')),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('PT. Suka-Suka', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Text('Kp. Cikereteg'),
              const Text('Telp: 085891434295'),
              const SizedBox(height: 16),
              const Divider(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Nota No: ............'),
              ),
              const Divider(),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                },
                children: [
                  const TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Nama', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Qty', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Harga', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Jumlah', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  ...items.map(
                    (item) {
                      int subtotal = item['qty'] * item['price'];
                      return TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(item['name']),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('${item['qty']}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Rp ${item['price']}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Rp $subtotal'),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total'),
                  Text('Rp $total'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Jumlah Uang'),
                  Text('Rp $paid'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Kembalian'),
                  Text('Rp $change'),
                ],
              ),
              const Divider(),
              const SizedBox(height: 15),
              const Text('Terima kasih atas kunjungannya', textAlign: TextAlign.center),
              const Text('Barang yang dibeli tidak dapat dikembalikan', textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}