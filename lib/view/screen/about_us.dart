import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('About Us'),
        backgroundColor: const Color(0xffe74c3c),
        leading: IconButton(
          icon:const Icon( Icons.arrow_back_ios,),
          onPressed: (){
            Get.back();

          },
        ),
      ),
      body:
      SafeArea(
        child: Padding(

          padding: const EdgeInsets.all(10.0),
          child: ListView(

            children: [
              const SizedBox(height: 20,),
              Text(
                'Company Name',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 8),
              Text(
                'Our mission is to provide high-quality products and services to our customers.',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 8),
              Text(
                'Founded in 2010, we have been serving the community for over 10 years. We are proud to have received numerous awards and recognition for our products and customer service.',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 8),
              Text(
                'Values:',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 8),
              Text(
                '- Customer satisfaction is our top priority',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                '- We strive for continuous improvement',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                '- We value honesty and integrity in all our actions',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 8),
              Text(
                'Awards and Recognition:',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 8),
              const ListTile(
                leading: Icon(Icons.check),
                title: Text('Best Product Award, 2012'),
              ),
              const ListTile(
                leading: Icon(Icons.check),
                title: Text('Customer Service Award, 2014'),
              ),
              Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Us:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      const ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text('123 Main Street'),
                        subtitle: Text('Anytown, USA 12345'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('(123) 456-7890'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.email),
                        title: Text('info@company.com'),
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
