import 'package:dating/utils/media.dart';
import 'package:dating/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colornotifire.dart';
import '../../utils/custombutton.dart';
import '../../utils/string.dart';
import '../../view_model/auth_view_model.dart';

class Sms extends StatefulWidget {
  String? name;
  String? email;
  String? birthDay;
  String? password;
  String? id;
  Sms(
      {required this.password,
      required this.email,
      required this.name,
      required this.id,
      required this.birthDay,
      Key? key})
      : super(key: key);

  @override
  State<Sms> createState() => _SmsState();
}

class _SmsState extends State<Sms> {
  String countryCode = '+44';
  final List<Map> _myjson = [
    {
      'id': '1',
      'image': '🇦🇱',
      'Text': "+355",
    },
    {
      'id': '2',
      'image': '🇩🇿',
      'Text': "+213",
    },
    {
      'id': '3',
      'image': '🇦🇸',
      //change by fahad
      'Text': "+1684",
    },
    {
      'id': '4',
      'image': '🇦🇩',
      'Text': "+376",
    },
    {
      'id': '5',
      'image': '🇦🇴',
      'Text': "+244",
    },
    {
      'id': '6',
      'image': '🇦🇮',
      //change by fahad

      'Text': "+1264",
    },
    {
      'id': '7',
      'image': '🇦🇶',
      'Text': "+672",
    },
    {
      'id': '8',
      'image': '🇦🇬',
      //change by fahad

      'Text': "+1268",
    },
    {
      'id': '9',
      'image': '🇦🇷',
      'Text': "+54",
    },
    {
      'id': '10',
      'image': '🇦🇲',
      'Text': "+374",
    },
    {
      'id': '11',
      'image': '🇦🇼',
      'Text': "+297",
    },
    {
      'id': '12',
      'image': '🇦🇺',
      'Text': "+61",
    },
    {
      'id': '13',
      'image': '🇦🇹',
      'Text': "+43",
    },
    {
      'id': '14',
      'image': '🇦🇿',
      'Text': "+994",
    },
    {
      'id': '15',
      'image': '🇧🇸',
      //change by fahad

      'Text': "+1242",
    },
    {
      'id': '16',
      'image': '🇧🇭',
      'Text': "+973",
    },
    {
      'id': '17',
      'image': '🇧🇩',
      'Text': "+880",
    },
    {
      'id': '18',
      'image': '🇧🇧',
      //change by fahad

      'Text': "+1246",
    },
    {
      'id': '19',
      'image': '🇧🇾',
      'Text': "+375",
    },
    {
      'id': '20',
      'image': '🇧🇪',
      'Text': "+32",
    },
    {
      'id': '21',
      'image': '🇧🇿',
      'Text': "+501",
    },
    {
      'id': '22',
      'image': '🇧🇯',
      'Text': "+229",
    },
    {
      'id': '23',
      'image': '🇧🇲',
      //change by fahad

      'Text': "+1441",
    },
    {
      'id': '24',
      'image': '🇧🇹',
      'Text': "+975",
    },
    {
      'id': '25',
      'image': '🇧🇴',
      'Text': "+591",
    },
    {
      'id': '26',
      'image': '🇧🇦',
      'Text': "+387",
    },
    {
      'id': '27',
      'image': '🇧🇼',
      'Text': "+267",
    },
    {
      'id': '28',
      'image': '🇧🇷',
      'Text': "+55",
    },
    {
      'id': '29',
      'image': '🇮🇴',
      'Text': "+246",
    },
    {
      'id': '30',
      'image': '🇻🇬',
      //change by fahad

      'Text': "+1284",
    },
    {
      'id': '31',
      'image': '🇧🇳',
      'Text': "+673",
    },
    {
      'id': '32',
      'image': '🇧🇬',
      'Text': "+359",
    },
    {
      'id': '33',
      'image': '🇧🇫',
      'Text': "+226",
    },
    {
      'id': '34',
      'image': '🇧🇮',
      'Text': "+257",
    },
    {
      'id': '35',
      'image': '🇰🇭',
      'Text': "+855",
    },
    {
      'id': '36',
      'image': '🇨🇲',
      'Text': "+237",
    },
    {
      'id': '37',
      'image': '🇨🇦',
      'Text': "+1",
    },
    {
      'id': '38',
      'image': '🇨🇻',
      'Text': "+238",
    },
    {
      'id': '39',
      'image': '🇰🇾',
      //change by fahad

      'Text': "+1345",
    },
    {
      'id': '40',
      'image': '🇨🇫',
      'Text': "+236",
    },
    {
      'id': '41',
      'image': '🇹🇩',
      'Text': "+235",
    },
    {
      'id': '42',
      'image': '🇨🇱',
      'Text': "+56",
    },
    {
      'id': '43',
      'image': '🇨🇳',
      'Text': "+86",
    },
    {
      'id': '44',
      'image': '🇨🇽',
      'Text': "+61",
    },
    {
      'id': '45',
      'image': '🇨🇨',
      'Text': "+61",
    },
    {
      'id': '46',
      'image': '🇨🇴',
      'Text': "+57",
    },
    {
      'id': '47',
      'image': '🇰🇲',
      'Text': "+269",
    },
    {
      'id': '48',
      'image': '🇨🇰',
      'Text': "+682",
    },
    {
      'id': '49',
      'image': '🇨🇷',
      'Text': "+506",
    },
    {
      'id': '50',
      'image': '🇭🇷',
      'Text': "+385",
    },
    {
      'id': '51',
      'image': '🇨🇺',
      'Text': "+53",
    },
    {
      'id': '52',
      'image': '🇨🇼',
      'Text': "+599",
    },
    {
      'id': '53',
      'image': '🇨🇾',
      'Text': "+357",
    },
    {
      'id': '54',
      'image': '🇨🇿',
      'Text': "+420",
    },
    {
      'id': '55',
      'image': '🇨🇩',
      'Text': "+243",
    },
    {
      'id': '56',
      'image': '🇩🇰',
      'Text': "+45",
    },
    {
      'id': '57',
      'image': '🇩🇯',
      'Text': "+253",
    },
    {
      'id': '58',
      'image': '🇩🇲',
      //change by fahad

      'Text': "+1767",
    },
    {
      'id': '59',
      'image': '🇩🇴',
      //change by fahad
      'Text': "+1809",
    },
    {
      'id': '60',
      'image': '🇩🇴',
      //change by fahad
      'Text': "+1829",
    },
    {
      'id': '61',
      'image': '🇩🇴',
      //change by fahad
      'Text': "+1849",
    },
    {
      'id': '62',
      'image': '🇹🇱',
      'Text': "+670",
    },
    {
      'id': '63',
      'image': '🇪🇨',
      'Text': "+593",
    },
    {
      'id': '64',
      'image': '🇪🇬',
      'Text': "+20",
    },
    {
      'id': '65',
      'image': '🇸🇻',
      'Text': "+503",
    },
    {
      'id': '66',
      'image': '🇬🇶',
      'Text': "+240",
    },
    {
      'id': '67',
      'image': '🇪🇷',
      'Text': "+291",
    },
    {
      'id': '68',
      'image': '🇪🇪',
      'Text': "+372",
    },
    {
      'id': '69',
      'image': '🇪🇹',
      'Text': "+251",
    },
    {
      'id': '70',
      'image': '🇫🇰',
      'Text': "+500",
    },
    {
      'id': '71',
      'image': '🇫🇴',
      'Text': "+298",
    },
    {
      'id': '72',
      'image': '🇫🇯',
      'Text': "+679",
    },
    {
      'id': '73',
      'image': '🇫🇮',
      'Text': "+358",
    },
    {
      'id': '74',
      'image': '🇫🇷',
      'Text': "+33",
    },
    {
      'id': '75',
      'image': '🇵🇫',
      'Text': "+689",
    },
    {
      'id': '76',
      'image': '🇬🇦',
      'Text': "+241",
    },
    {
      'id': '77',
      'image': '🇬🇲',
      'Text': "+220",
    },
    {
      'id': '78',
      'image': '🇬🇪',
      'Text': "+995",
    },
    {
      'id': '79',
      'image': '🇩🇪',
      'Text': "+49",
    },
    {
      'id': '80',
      'image': '🇬🇭',
      'Text': "+233",
    },
    {
      'id': '81',
      'image': '🇬🇮',
      'Text': "+350",
    },
    {
      'id': '82',
      'image': '🇬🇷',
      'Text': "+30",
    },
    {
      'id': '83',
      'image': '🇬🇱',
      'Text': "+299",
    },
    {
      'id': '84',
      'image': '🇬🇩',
      //change by fahad
      'Text': "+1473",
    },
    {
      'id': '85',
      'image': '🇬🇺',
      //change by fahad
      'Text': "+1671",
    },
    {
      'id': '86',
      'image': '🇬🇹',
      'Text': "+502",
    },
    {
      'id': '87',
      'image': '🇬🇬',
      //change by fahad
      'Text': "+441481",
    },
    {
      'id': '88',
      'image': '🇬🇳',
      'Text': "+224",
    },
    {
      'id': '89',
      'image': '🇬🇼',
      'Text': "+245",
    },
    {
      'id': '90',
      'image': '🇬🇾',
      'Text': "+592",
    },
    {
      'id': '91',
      'image': '🇭🇹',
      'Text': "+509",
    },
    {
      'id': '92',
      'image': '🇭🇳',
      'Text': "+504",
    },
    {
      'id': '93',
      'image': '🇭🇰',
      'Text': "+852",
    },
    {
      'id': '94',
      'image': '🇭🇺',
      'Text': "+36",
    },
    {
      'id': '95',
      'image': '🇮🇸',
      'Text': "+354",
    },
    {
      'id': '96',
      'image': '🇮🇳',
      'Text': "+91",
    },
    {
      'id': '97',
      'image': '🇮🇩',
      'Text': "+62",
    },
    {
      'id': '98',
      'image': '🇮🇷',
      'Text': "+98",
    },
    {
      'id': '99',
      'image': '🇮🇶',
      'Text': "+964",
    },
    {
      'id': '100',
      'image': '🇮🇪',
      'Text': "+353",
    },
    {
      'id': '101',
      'image': '🇮🇱',
      //change by fahad
      'Text': "+441624",
    },
    {
      'id': '102',
      'image': '🇮🇱',
      'Text': "+972",
    },
    {
      'id': '103',
      'image': '🇮🇹',
      'Text': "+39",
    },
    {
      'id': '104',
      'image': '🇨🇮',
      'Text': "+225",
    },
    {
      'id': '105',
      'image': '🇯🇲',
      //change by fahad
      'Text': "+1876",
    },
    {
      'id': '106',
      'image': '🇯🇵',
      'Text': "+81",
    },
    {
      'id': '107',
      'image': '🇯🇪',
      //change by fahad
      'Text': "+441534",
    },
    {
      'id': '108',
      'image': '🇯🇴',
      'Text': "+962",
    },
    {
      'id': '109',
      'image': '🇰🇿',
      'Text': "+7",
    },
    {
      'id': '110',
      'image': '🇰🇪',
      'Text': "+254",
    },
    {
      'id': '111',
      'image': '🇰🇮',
      'Text': "+686",
    },
    {
      'id': '112',
      'image': '🇽🇰',
      'Text': "+383",
    },
    {
      'id': '113',
      'image': '🇰🇼',
      'Text': "+965",
    },
    {
      'id': '114',
      'image': '🇰🇬',
      'Text': "+996",
    },
    {
      'id': '115',
      'image': '🇰🇱🇦',
      'Text': "+856",
    },
    {
      'id': '116',
      'image': '🇱🇻',
      'Text': "+371",
    },
    {
      'id': '117',
      'image': '🇱🇧',
      'Text': "+961",
    },
    {
      'id': '118',
      'image': '🇱🇸',
      'Text': "+266",
    },
    {
      'id': '119',
      'image': '🇱🇷',
      'Text': "+231",
    },
    {
      'id': '120',
      'image': '🇱🇾',
      'Text': "+218",
    },
    {
      'id': '121',
      'image': '🇱🇮',
      'Text': "+423",
    },
    {
      'id': '122',
      'image': '🇱🇹',
      'Text': "+370",
    },
    {
      'id': '123',
      'image': '🇱🇺',
      'Text': "+352",
    },
    {
      'id': '124',
      'image': '🇲🇴',
      'Text': "+853",
    },
    {
      'id': '125',
      'image': '🇲🇰',
      'Text': "+389",
    },
    {
      'id': '126',
      'image': '🇲🇬',
      'Text': "+261",
    },
    {
      'id': '127',
      'image': '🇲🇼',
      'Text': "+265",
    },
    {
      'id': '128',
      'image': '🇲🇾',
      'Text': "+60",
    },
    {
      'id': '129',
      'image': '🇲🇻',
      'Text': "+960",
    },
    {
      'id': '130',
      'image': '🇲🇱',
      'Text': "+223",
    },
    {
      'id': '131',
      'image': '🇲🇹',
      'Text': "+356",
    },
    {
      'id': '132',
      'image': '🇲🇭',
      'Text': "+692",
    },
    {
      'id': '133',
      'image': '🇲🇷',
      'Text': "+222",
    },
    {
      'id': '134',
      'image': '🇲🇺',
      'Text': "+230",
    },
    {
      'id': '135',
      'image': '🇾🇹',
      'Text': "+262",
    },
    {
      'id': '136',
      'image': '🇲🇽',
      'Text': "+52",
    },
    {
      'id': '137',
      'image': '🇫🇲',
      'Text': "+691",
    },
    {
      'id': '138',
      'image': '🇲🇩',
      'Text': "+373",
    },
    {
      'id': '139',
      'image': '🇲🇨',
      'Text': "+377",
    },
    {
      'id': '140',
      'image': '🇲🇳',
      'Text': "+976",
    },
    {
      'id': '141',
      'image': '🇲🇪',
      'Text': "+382",
    },
    {
      'id': '142',
      'image': '🇲🇸',
      //change by fahad
      'Text': "+1664",
    },
    {
      'id': '143',
      'image': '🇲🇦',
      'Text': "+212",
    },
    {
      'id': '144',
      'image': '🇲🇿',
      'Text': "+258",
    },
    {
      'id': '145',
      'image': '🇲🇲',
      'Text': "+95",
    },
    {
      'id': '146',
      'image': '🇳🇦',
      'Text': "+264",
    },
    {
      'id': '147',
      'image': '🇳🇷',
      'Text': "+674",
    },
    {
      'id': '148',
      'image': '🇳🇵',
      'Text': "+977",
    },
    {
      'id': '149',
      'image': '🇳🇱',
      'Text': "+31",
    },
    {
      'id': '150',
      'image': '🇦🇳',
      'Text': "+599",
    },
    {
      'id': '151',
      'image': '🇳🇨',
      'Text': "+687",
    },
    {
      'id': '152',
      'image': '🇳🇿',
      'Text': "+64",
    },
    {
      'id': '153',
      'image': '🇳🇮',
      'Text': "+505",
    },
    {
      'id': '154',
      'image': '🇳🇪',
      'Text': "+227",
    },
    {
      'id': '155',
      'image': '🇳🇬',
      'Text': "+234",
    },
    {
      'id': '156',
      'image': '🇳🇺',
      'Text': "+683",
    },
    {
      'id': '157',
      'image': '🇰🇵',
      'Text': "+850",
    },
    {
      'id': '158',
      'image': '🇲🇵',
      //change by fahad
      'Text': "+1670",
    },
    {
      'id': '159',
      'image': '🇳🇴',
      'Text': "+47",
    },
    {
      'id': '160',
      'image': '🇴🇲',
      'Text': "+968",
    },
    {
      'id': '161',
      'image': '🇵🇰',
      'Text': "+92",
    },
    {
      'id': '162',
      'image': '🇵🇼',
      'Text': "+680",
    },
    {
      'id': '163',
      'image': '🇵🇸',
      'Text': "+970",
    },
    {
      'id': '164',
      'image': '🇵🇦',
      'Text': "+507",
    },
    {
      'id': '165',
      'image': '🇵🇬',
      'Text': "+675",
    },
    {
      'id': '166',
      'image': '🇵🇾',
      'Text': "+595",
    },
    {
      'id': '167',
      'image': '🇵🇪',
      'Text': "+51",
    },
    {
      'id': '168',
      'image': '🇵🇭',
      'Text': "+63",
    },
    {
      'id': '169',
      'image': '🇵🇳',
      'Text': "+64",
    },
    {
      'id': '170',
      'image': '🇵🇱',
      'Text': "+48",
    },
    {
      'id': '171',
      'image': '🇵🇹',
      'Text': "+351",
    },
    {
      'id': '172',
      'image': '🇵🇷',
      //change by fahad
      'Text': "+1787",
    },
    {
      'id': '173',
      'image': '🇵🇷',
      //change by fahad
      'Text': "+1939",
    },
    {
      'id': '174',
      'image': '🇵🇶🇦',
      'Text': "+974",
    },
    {
      'id': '175',
      'image': '🇨🇬',
      'Text': "+242",
    },
    {
      'id': '176',
      'image': '🇷🇪',
      'Text': "+262",
    },
    {
      'id': '177',
      'image': '🇷🇴',
      'Text': "+40",
    },
    {
      'id': '178',
      'image': '🇷🇺',
      'Text': "+7",
    },
    {
      'id': '179',
      'image': '🇷🇼',
      'Text': "+250",
    },
    {
      'id': '180',
      'image': '🇸🇭',
      'Text': "+290",
    },
    {
      'id': '181',
      'image': '🇰🇳',
      //change by fahad
      'Text': "+1869",
    },
    {
      'id': '182',
      'image': '🇱🇨',
      //change by fahad
      'Text': "+1758",
    },
    {
      'id': '183',
      'image': '🇲🇫',
      'Text': "+590",
    },
    {
      'id': '184',
      'image': '🇵🇲',
      'Text': "+508",
    },
    {
      'id': '185',
      'image': '🇻🇨',
      //change by fahad
      'Text': "+1784",
    },
    {
      'id': '186',
      'image': '🇼🇸',
      'Text': "+685",
    },
    {
      'id': '187',
      'image': '🇸🇲',
      'Text': "+378",
    },
    {
      'id': '188',
      'image': '🇸🇹',
      'Text': "+239",
    },
    {
      'id': '189',
      'image': '🇸🇦',
      'Text': "+966",
    },
    {
      'id': '190',
      'image': '🇸🇳',
      'Text': "+221",
    },
    {
      'id': '191',
      'image': '🇷🇸',
      'Text': "+381",
    },
    {
      'id': '192',
      'image': '🇸🇨',
      'Text': "+248",
    },
    {
      'id': '193',
      'image': '🇸🇱',
      'Text': "+232",
    },
    {
      'id': '194',
      'image': '🇸🇬',
      'Text': "+65",
    },
    {
      'id': '195',
      'image': '🇸🇽',
      //change by fahad
      'Text': "+1721",
    },
    {
      'id': '196',
      'image': '🇸🇰',
      'Text': "+421",
    },
    {
      'id': '197',
      'image': '🇸🇮',
      'Text': "+386",
    },
    {
      'id': '198',
      'image': '🇸🇧',
      'Text': "+677",
    },
    {
      'id': '199',
      'image': '🇸🇴',
      'Text': "+252",
    },
    {
      'id': '200',
      'image': '🇿🇦',
      'Text': "+27",
    },
    {
      'id': '201',
      'image': '🇰🇷',
      'Text': "+82",
    },
    {
      'id': '202',
      'image': '🇸🇸',
      'Text': "+211",
    },
    {
      'id': '203',
      'image': '🇪🇸',
      'Text': "+34",
    },
    {
      'id': '204',
      'image': '🇱🇰',
      'Text': "+94",
    },
    {
      'id': '205',
      'image': '🇸🇩',
      'Text': "+249",
    },
    {
      'id': '206',
      'image': '🇸🇷',
      'Text': "+597",
    },
    {
      'id': '207',
      'image': '🇸🇯',
      'Text': "+47",
    },
    {
      'id': '208',
      'image': '🇸🇿',
      'Text': "+268",
    },
    {
      'id': '209',
      'image': '🇸🇪',
      'Text': "+46",
    },
    {
      'id': '210',
      'image': '🇨🇭',
      'Text': "+41",
    },
    {
      'id': '211',
      'image': '🇸🇾',
      'Text': "+963",
    },
    {
      'id': '212',
      'image': '🇹🇼',
      'Text': "+886",
    },
    {
      'id': '213',
      'image': '🇹🇯',
      'Text': "+992",
    },
    {
      'id': '214',
      'image': '🇹🇿',
      'Text': "+255",
    },
    {
      'id': '215',
      'image': '🇹🇭',
      'Text': "+66",
    },
    {
      'id': '216',
      'image': '🇹🇬',
      'Text': "+228",
    },
    {
      'id': '217',
      'image': '🇹🇰',
      'Text': "+690",
    },
    {
      'id': '218',
      'image': '🇹🇴',
      'Text': "+676",
    },
    {
      'id': '219',
      'image': '🇹🇹',
      //change by fahad
      'Text': "+1868",
    },
    {
      'id': '220',
      'image': '🇹🇳',
      'Text': "+216",
    },
    {
      'id': '221',
      'image': '🇹🇷',
      'Text': "+90",
    },
    {
      'id': '222',
      'image': '🇹🇲',
      'Text': "+993",
    },
    {
      'id': '223',
      'image': '🇹🇨',
      //change by fahad
      'Text': "+1649",
    },
    {
      'id': '224',
      'image': '🇹🇻',
      'Text': "+688",
    },
    {
      'id': '225',
      'image': '🇻🇮',
      //change by fahad
      'Text': "+1340",
    },
    {
      'id': '226',
      'image': '🇺🇬',
      'Text': "+256",
    },
    {
      'id': '227',
      'image': '🇺🇦',
      'Text': "+380",
    },
    {
      'id': '228',
      'image': '🇦🇪',
      'Text': "+971",
    },
    {
      'id': '229',
      'image': '🇬🇧',
      'Text': "+44",
    },
    {
      'id': '230',
      'image': '🇺🇸',
      'Text': "+1",
    },
    {
      'id': '231',
      'image': '🇺🇾',
      'Text': "+598",
    },
    {
      'id': '232',
      'image': '🇺🇿',
      'Text': "+998",
    },
    {
      'id': '233',
      'image': '🇻🇺',
      'Text': "+678",
    },
    {
      'id': '234',
      'image': '🇻🇦',
      'Text': "+379",
    },
    {
      'id': '235',
      'image': '🇻🇪',
      'Text': "+58",
    },
    {
      'id': '236',
      'image': '🇻🇳',
      'Text': "+84",
    },
    {
      'id': '237',
      'image': '🇼🇫',
      'Text': "+681",
    },
    {
      'id': '238',
      'image': '🇪🇭',
      'Text': "+212",
    },
    {
      'id': '239',
      'image': '🇾🇪',
      'Text': "+967",
    },
    {
      'id': '240',
      'image': '🇿🇲',
      'Text': "+260",
    },
    {
      'id': '241',
      'image': '🇿🇼',
      'Text': "+263",
    },
    {
      'id': '242',
      'image': '🇦🇫',
      'Text': "+93",
    },
    {
      'id': '243',
      'image': '🇧🇱',
      'Text': "+590",
    },
  ];
  String? _selectedindex;
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 6,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CustomStrings.canget,
                      style: TextStyle(
                          color: notifire.getdarkspinkcolor,
                          fontSize: height / 18,
                          fontFamily: 'Gilroy Bold'),
                    ),
                    Text(
                      CustomStrings.digits,
                      style: TextStyle(
                          color: notifire.getdarkspinkcolor,
                          fontSize: height / 18,
                          fontFamily: 'Gilroy Bold'),
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    Text(
                      CustomStrings.number1,
                      style: TextStyle(
                          color: notifire.getgreycolor,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Medium'),
                    ),
                    Text(
                      CustomStrings.number2,
                      style: TextStyle(
                          color: notifire.getgreycolor,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Medium'),
                    ),
                    SizedBox(
                      height: height / 10,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: notifire.getpinkscolor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          height: height / 20,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              buttonColor: notifire.getdarkpinkscolor,
                              child: DropdownButton<String>(
                                dropdownColor:
                                    notifire.getpinkscolor.withOpacity(0.4),
                                icon: Padding(
                                  padding: EdgeInsets.only(right: width / 100),
                                  child: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.white),
                                ),
                                hint: Row(
                                  children: [
                                    SizedBox(
                                      width: width / 40,
                                    ),
                                    Image.asset(
                                      "image/flagfive.png",
                                      width: width / 15,
                                    ),
                                    SizedBox(
                                      width: width / 40,
                                    ),
                                    const Text(
                                      "+44",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gilroy Medium'),
                                    )
                                  ],
                                ),
                                value: _selectedindex,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedindex = newValue;

                                    int index =
                                        int.parse(newValue.toString()) - 1;

                                    countryCode = _myjson[index]['Text'];

                                    if (kDebugMode) {
                                      print(countryCode);
                                    }
                                  });
                                },
                                items: _myjson.map(
                                  (Map map) {
                                    return DropdownMenuItem<String>(
                                      value: map["id"].toString(),
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: width / 40,
                                          ),
                                          Text(
                                            map["image"].toString(),
                                          ),
                                          SizedBox(
                                            width: width / 40,
                                          ),
                                          Text(
                                            map["Text"].toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                          SizedBox(
                                            width: width / 50,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width / 20,
                        ),
                        Container(
                          color: Colors.transparent,
                          height: height / 16,
                          width: width / 2,
                          child: TextField(
                            controller: _phoneNumber,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: notifire.getdarkscolor),
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding:
                                  EdgeInsets.only(left: height / 80),
                              fillColor: notifire.getprimerycolor,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "7811122224",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: height / 40,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height / 4.5,
            ),
            GestureDetector(
                onTap: () {
                  if (widget.name != '' && widget.email != '') {
                    if (_phoneNumber.text.isNotEmpty || widget.name == '') {
                      Map data = {
                        'name': widget.name,
                        'email': widget.email,
                        'phoneNumber':
                            countryCode + _phoneNumber.text.toString().trim(),
                        'birthDate': widget.birthDay,
                        'password': widget.password,
                      };

                      authViewModel.registerApi(context, data: data);
                    } else {
                      Utils.flutterToast(
                          'Enter Phone Number or something wrong');
                    }
                  } else {
                    if (_phoneNumber.text.isNotEmpty) {
                      Map data = {
                        'id': widget.id,
                        'phoneNumber':
                            countryCode + _phoneNumber.text.toString().trim(),
                      };

                      authViewModel.sendOTPByPhoneNumber(context, data: data);
                    } else {
                      Utils.flutterToast(
                          'Enter Phone Number or something wrong');
                    }
                  }
                },
                child: Custombutton.button(
                    CustomStrings.continues,
                    notifire.getgcolor,
                    notifire.getg2color,
                    notifire.getg3color,
                    notifire.getg4color)),
          ],
        ),
      ),
    );
  }
}
