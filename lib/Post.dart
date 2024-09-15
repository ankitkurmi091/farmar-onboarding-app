import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
    // Your payload and URL
    String payload = jsonEncode({
        "full_name": "john doe",
        "email": "johndoe@mail.com",
        "phone": "+19876543210",
        "password": "12345678",
        "role": "farmer",
        "business_name": "Dairy Farm",
        "informal_name": "London Dairy",
        "address": "3663 Marshville Road",
        "city": "Poughkeepsie",
        "state": "New York",
        "zip_code": 12601,
        "registration_proof": "my_proof.pdf",
        // "business_hours": {
        //     "mon": [
        //         "8:00am - 10:00am",
        //         "10:00am - 1:00pm"
        //     ],
        //     "tue": [
        //         "8:00am - 10:00am",
        //         "10:00am - 1:00pm"
        //     ],
        //     "wed": [
        //         "8:00am - 10:00am",
        //         "10:00am - 1:00pm",
        //         "1:00pm - 4:00pm"
        //     ],
        //     "thu": [
        //         "8:00am - 10:00am",
        //         "10:00am - 1:00pm",
        //         "1:00pm - 4:00pm"
        //     ],
        //     "fri": [
        //         "8:00am - 10:00am",
        //         "10:00am - 1:00pm"
        //     ],
        //     "sat": [
        //         "8:00am - 10:00am",
        //         "10:00am - 1:00pm"
        //     ],
        //     "sun": [
        //         "8:00am -10:00am"
        //     ]
        // },
        "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
        "type": "email",
        "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"

    });
print(payload);
    Map<String,dynamic> map = Map();
    String url = 'https://sowlab.com/assignment/user/login';

    try {
        http.Response response = await http.post(
            Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: payload,
        );
        print('Status Code: ${response.statusCode}');

        // print('Response Body: ${response.body}');

        String responseData = response.body;

        Map<String,dynamic> map = jsonDecode(responseData);

        String isSuccess = map['success'];
        String token = map['token'];

    } catch (e) {
        print('Error: $e');
    }
}
