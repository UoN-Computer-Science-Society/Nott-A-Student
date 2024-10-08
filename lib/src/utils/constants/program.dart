import 'package:flutter/material.dart';

List<DropdownMenuEntry<String>> createDropdownItems(
    String selectedKey, Map<String, String> data) {
  List<DropdownMenuEntry<String>> items = [];

  data.forEach((label, value) {
    items.add(
      DropdownMenuEntry(
        value: value,
        label: label,
      ),
    );
  });

  return items;
}

Map<String, Map<String, String>> data = {
  "MSC-ED": {
    "BA Hons Education  (TESOL)/F/01 - XNM4 Education  (TESOL)":
        "UG/M1015/M6UEDUCT/F/01",
    "BA Hons Education  (TESOL)/F/02 - XNM4 Education  (TESOL)":
        "UG/M1015/M6UEDUCT/F/02",
    "BA Hons Education  (TESOL)/F/03 - XNM4 Education  (TESOL)":
        "UG/M1015/M6UEDUCT/F/03",
    "BEd Hons TESOL/F/01 - XNM3 TESOL": "UG/M1023/M6UTESOL/F/01",
    "BEd Hons TESOL/F/02 - XNM3 TESOL": "UG/M1023/M6UTESOL/F/02",
    "BEd Hons TESOL/F/03 - XNM3 TESOL": "UG/M1023/M6UTESOL/F/03",
    "BEd Hons TESOL/F/04 - XNM3 TESOL": "UG/M1023/M6UTESOL/F/04",
    "Education  (TESOL) Short Crs/F/01 - XNM4 Education  (TESOL)":
        "UG/M1015/M6UEDUCTSC/F/01",
    "Education  (TESOL) Short Crs/F/02 - XNM4 Education  (TESOL)":
        "UG/M1015/M6UEDUCTSC/F/02",
    "Education  (TESOL) Short Crs/F/03 - XNM4 Education  (TESOL)":
        "UG/M1015/M6UEDUCTSC/F/03",
    "MA Edl Leadership & Mgmt/F/01 - X399 Educational Leadership and Management":
        "PGT/M1263/M7PELMTMJF/F/01",
    "MA Edl Leadership & Mgmt/P/01 - X399 Educational Leadership and Management":
        "PGT/M1263/M7PELMTMJP/P/01",
    "MA Edl Leadership & Mgmt/P/02 - X399 Educational Leadership and Management":
        "PGT/M1263/M7PELMTMJP/P/02",
    "MA Edl Leadership & Mgmt/P/03 - X399 Educational Leadership and Management":
        "PGT/M1263/M7PELMTMJP/P/03",
    "MA Edl Leadership & Mgmt/P/04 - X399 Educational Leadership and Management":
        "PGT/M1263/M7PELMTMJP/P/04",
    "MA Education (GGS)/P/01 - X309 Education": "PGT/M1196/M7PEDCTNP/P/01",
    "MA Education (GGS)/P/02 - X309 Education": "PGT/M1196/M7PEDCTNP/P/02",
    "MA Education (GGS)/P/03 - X309 Education": "PGT/M1196/M7PEDCTNP/P/03",
    "MA Education (GGS)/P/04 - X309 Education": "PGT/M1196/M7PEDCTNP/P/04",
    "MA Education (NAA)/P/01 - x309 Education": "PGT/M1238/M7PEDCTNAA/P/01",
    "MA Education (NAA)/P/02 - x309 Education": "PGT/M1238/M7PEDCTNAA/P/02",
    "MA Education (NAA)/P/03 - x309 Education": "PGT/M1238/M7PEDCTNAA/P/03",
    "MA Education (NAA)/P/04 - x309 Education": "PGT/M1238/M7PEDCTNAA/P/04",
    "MA Education Lead & Mgmt/F/01 - X399 Educational Leadership and Management":
        "PGT/M1253/M7PELMTMSF/F/01",
    "MA Education/F/01 - X309 Education": "PGT/M1262/M7PEDCTMJF/F/01",
    "MA Education/P/01 - X309 Education": "PGT/M1262/M7PEDCTMJP/P/01",
    "MA Education/P/02 - X309 Education": "PGT/M1262/M7PEDCTMJP/P/02",
    "MA Education/P/03 - X309 Education": "PGT/M1262/M7PEDCTMJP/P/03",
    "MA Education/P/04 - X309 Education": "PGT/M1262/M7PEDCTMJP/P/04",
    "MA EducationLead&Mgmt(MoE-SL)/P/01 - X399 Educational Leadership and Management":
        "PGT/M1253/M7PELMTMSP/P/01",
    "MA EducationLead&Mgmt(MoE-SL)/P/02 - X399 Educational Leadership and Management":
        "PGT/M1253/M7PELMTMSP/P/02",
    "MA EducationLead&Mgmt(MoE-SL)/P/03 - X399 Educational Leadership and Management":
        "PGT/M1253/M7PELMTMSP/P/03",
    "MA EducationLead&Mgmt(MoE-SL)/P/04 - X399 Educational Leadership and Management":
        "PGT/M1253/M7PELMTMSP/P/04",
    "MA Special & Inclusive Edu/F/01 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDMJF/F/01",
    "MA Special & Inclusive Edu/P/01 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDMJP/P/01",
    "MA Special & Inclusive Edu/P/02 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDMJP/P/02",
    "MA Special & Inclusive Edu/P/03 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDMJP/P/03",
    "MA Special & Inclusive Edu/P/04 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDMJP/P/04",
    "MA TESOL/F/01 - X31V Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLMJF/F/01",
    "MA TESOL/P/01 - X31V Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLMJP/P/01",
    "MA TESOL/P/02 - X31V Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLMJP/P/02",
    "MA TESOL/P/03 - X31V Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLMJP/P/03",
    "MA TESOL/P/04 - X31V Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLMJP/P/04",
    "PG Cert Education SL (GGS)/P/01 - X31M Education":
        "PGT/M1196/M7PEDCCSL/P/01",
    "PG Cert Education SL (GGS)/P/02 - X31M Education":
        "PGT/M1196/M7PEDCCSL/P/02",
    "PG Cert Education SL (GGS)/P/03 - X31M Education":
        "PGT/M1196/M7PEDCCSL/P/03",
    "PG Cert Education SL (GGS)/P/04 - X31M Education":
        "PGT/M1196/M7PEDCCSL/P/04",
    "PG Cert Education/F/01 - X31M Education": "PGT/M1262/M7PEDCTCJF/F/01",
    "PG Cert Education/P/01 - X31M Education": "PGT/M1262/M7PEDCTCJP/P/01",
    "PG Cert Education/P/02 - X31M Education": "PGT/M1262/M7PEDCTCJP/P/02",
    "PG Cert Education/P/03 - X31M Education": "PGT/M1262/M7PEDCTCJP/P/03",
    "PG Cert Education/P/04 - X31M Education": "PGT/M1262/M7PEDCTCJP/P/04",
    "PG Cert Higher Education (Int)/F/01 - X1Z3 Higher Education":
        "PGT/M1243/M7PHEDICNF/F/01",
    "PG Cert Higher Education (Int)/P/01 - X1Z3 Higher Education":
        "PGT/M1243/M7PHEDICNP/P/01",
    "PG Cert Higher Education (Int)/P/02 - X1Z3 Higher Education":
        "PGT/M1243/M7PHEDICNP/P/02",
    "PG Cert Higher Education (Int)/P/03 - X1Z3 Higher Education":
        "PGT/M1243/M7PHEDICNP/P/03",
    "PG Cert Higher Education (Int)/P/04 - X1Z3 Higher Education":
        "PGT/M1243/M7PHEDICNP/P/04",
    "PG Dip Education (NAA)/P/01 - X30M Education": "PGT/M1238/M7PEDCTNAD/P/01",
    "PG Dip Education (NAA)/P/02 - X30M Education": "PGT/M1238/M7PEDCTNAD/P/02",
    "PG Dip Education (NAA)/P/03 - X30M Education": "PGT/M1238/M7PEDCTNAD/P/03",
    "PG Dip Education (NAA)/P/04 - X30M Education": "PGT/M1238/M7PEDCTNAD/P/04",
    "PG Dip Education SL (GGS)/P/01 - X30M Education":
        "PGT/M1196/M7PEDCDSL/P/01",
    "PG Dip Education SL (GGS)/P/02 - X30M Education":
        "PGT/M1196/M7PEDCDSL/P/02",
    "PG Dip Education SL (GGS)/P/03 - X30M Education":
        "PGT/M1196/M7PEDCDSL/P/03",
    "PG Dip Education SL (GGS)/P/04 - X30M Education":
        "PGT/M1196/M7PEDCDSL/P/04",
    "PG Dip Education/F/01 - X30M Education": "PGT/M1262/M7PEDCTDJF/F/01",
    "PG Dip Education/P/01 - X30M Education": "PGT/M1262/M7PEDCTDJP/P/01",
    "PG Dip Education/P/02 - X30M Education": "PGT/M1262/M7PEDCTDJP/P/02",
    "PG Dip Education/P/03 - X30M Education": "PGT/M1262/M7PEDCTDJP/P/03",
    "PG Dip Education/P/04 - X30M Education": "PGT/M1262/M7PEDCTDJP/P/04",
    "PGCert Ed Lead & Mgmt/F/01 - X38K Educational Leadership and Management":
        "PGT/M1263/M7PELMTCJF/F/01",
    "PGCert Ed Lead & Mgmt/P/01 - X38K Educational Leadership and Management":
        "PGT/M1263/M7PELMTCJP/P/01",
    "PGCert Ed Lead & Mgmt/P/01 - X38k Educational Leadership and Management":
        "PGT/M1253/M7PELMTCSP/P/01",
    "PGCert Ed Lead & Mgmt/P/02 - X38K Educational Leadership and Management":
        "PGT/M1263/M7PELMTCJP/P/02",
    "PGCert Ed Lead & Mgmt/P/02 - X38k Educational Leadership and Management":
        "PGT/M1253/M7PELMTCSP/P/02",
    "PGCert Ed Lead & Mgmt/P/03 - X38K Educational Leadership and Management":
        "PGT/M1263/M7PELMTCJP/P/03",
    "PGCert Ed Lead & Mgmt/P/03 - X38k Educational Leadership and Management":
        "PGT/M1253/M7PELMTCSP/P/03",
    "PGCert Ed Lead & Mgmt/P/04 - X38K Educational Leadership and Management":
        "PGT/M1263/M7PELMTCJP/P/04",
    "PGCert Ed Lead & Mgmt/P/04 - X38k Educational Leadership and Management":
        "PGT/M1253/M7PELMTCSP/P/04",
    "PGCert Edu Leadership & Mgt/F/01 - X38K Educational Leadership  and Management":
        "PGT/M1112/M7PEDCLPC/F/01",
    "PGCert Edu Leadership & Mgt/P/01 - X38K Educational Leadership  and Management":
        "PGT/M1112/M7PEDCLPC/P/01",
    "PGCert Edu Leadership & Mgt/P/02 - X38K Educational Leadership  and Management":
        "PGT/M1112/M7PEDCLPC/P/02",
    "PGCert Edu Leadership & Mgt/P/03 - X38K Educational Leadership  and Management":
        "PGT/M1112/M7PEDCLPC/P/03",
    "PGCert Edu Leadership & Mgt/P/04 - X38K Educational Leadership  and Management":
        "PGT/M1112/M7PEDCLPC/P/04",
    "PGCert EducationLead&Mgmt(ABT)/P/01 - x399 Educational Leadership and Management":
        "PGT/M1206/M7PEDULMAB/P/01",
    "PGCert EducationLead&Mgmt(ABT)/P/02 - x399 Educational Leadership and Management":
        "PGT/M1206/M7PEDULMAB/P/02",
    "PGCert EducationLead&Mgmt(ABT)/P/03 - x399 Educational Leadership and Management":
        "PGT/M1206/M7PEDULMAB/P/03",
    "PGCert EducationLead&Mgmt(ABT)/P/04 - x399 Educational Leadership and Management":
        "PGT/M1206/M7PEDULMAB/P/04",
    "PGCert Special & Inc Edu/F/01 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDCJF/F/01",
    "PGCert Special & Inc Edu/P/01 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDCJP/P/01",
    "PGCert Special & Inc Edu/P/02 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDCJP/P/02",
    "PGCert Special & Inc Edu/P/03 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDCJP/P/03",
    "PGCert Special & Inc Edu/P/04 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDCJP/P/04",
    "PGCert TESOL/F/01 - X31U Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLCJF/F/01",
    "PGCert TESOL/P/01 - X31U Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLCJP/P/01",
    "PGCert TESOL/P/02 - X31U Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLCJP/P/02",
    "PGCert TESOL/P/03 - X31U Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLCJP/P/03",
    "PGCert TESOL/P/04 - X31U Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLCJP/P/04",
    "PGDip Edl Leadership & Mgmt/F/01 - X399 Educational Leadership and Management":
        "PGT/M1263/M7PELMTDJF/F/01",
    "PGDip Edl Leadership & Mgmt/F/01 - x399 Educational Leadership and Management":
        "PGT/M1258/M7PELMTDFF/F/01",
    "PGDip Edl Leadership & Mgmt/P/01 - X399 Educational Leadership and Management":
        "PGT/M1263/M7PELMTDJP/P/01",
    "PGDip Edl Leadership & Mgmt/P/02 - X399 Educational Leadership and Management":
        "PGT/M1263/M7PELMTDJP/P/02",
    "PGDip Edl Leadership & Mgmt/P/03 - X399 Educational Leadership and Management":
        "PGT/M1263/M7PELMTDJP/P/03",
    "PGDip Edl Leadership & Mgmt/P/04 - X399 Educational Leadership and Management":
        "PGT/M1263/M7PELMTDJP/P/04",
    "PGDip Educational Leadership/F/01 - X38J Educational Leadership and Management":
        "PGT/M1112/M7PEDCLPD/F/01",
    "PGDip Educational Leadership/P/01 - X38J Educational Leadership and Management":
        "PGT/M1112/M7PEDCLPD/P/01",
    "PGDip Educational Leadership/P/02 - X38J Educational Leadership and Management":
        "PGT/M1112/M7PEDCLPD/P/02",
    "PGDip Educational Leadership/P/03 - X38J Educational Leadership and Management":
        "PGT/M1112/M7PEDCLPD/P/03",
    "PGDip Educational Leadership/P/04 - X38J Educational Leadership and Management":
        "PGT/M1112/M7PEDCLPD/P/04",
    "PGDip Special & Inc Edu/F/01 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDDJF/F/01",
    "PGDip Special & Inc Edu/P/01 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDDJP/P/01",
    "PGDip Special & Inc Edu/P/02 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDDJP/P/02",
    "PGDip Special & Inc Edu/P/03 - X365 Special and Inclusive Education":
        "PGT/M1264/M7PSIEDDJP/P/03",
    "PGDip TESOL/F/01 - X31S Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLDJF/F/01",
    "PGDip TESOL/P/01 - X31S Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLDJP/P/01",
    "PGDip TESOL/P/02 - X31S Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLDJP/P/02",
    "PGDip TESOL/P/03 - X31S Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLDJP/P/03",
    "PGDip TESOL/P/04 - X31S Teaching of English to Speakers of Other Languages":
        "PGT/M1265/M7PTSOLDJP/P/04"
  },
  "MSC-ENGL": {
    "BA Hons Engl w Creative Writ/F/01 - QNM1 English with Creative Writing":
        "UG/M1016/M6UENLCW/F/01",
    "BA Hons Engl w Creative Writ/F/02 - QNM1 English with Creative Writing":
        "UG/M1016/M6UENLCW/F/02",
    "BA Hons Engl w Creative Writ/F/03 - QNM1 English with Creative Writing":
        "UG/M1016/M6UENLCW/F/03",
    "BA Hons English Language & Lit/F/01 - QNM2 English Language and Literature":
        "UG/M1074/M6UENLLL/F/01",
    "BA Hons English Language & Lit/F/02 - QNM2 English Language and Literature":
        "UG/M1074/M6UENLLL/F/02",
    "BA Hons English Language & Lit/F/03 - QNM2 English Language and Literature":
        "UG/M1074/M6UENLLL/F/03",
    "MA English Language & Lit/F/01 - QNM3 English Language and Literature":
        "PGT/M1073/M7PENLLL/F/01",
    "MA English Language & Lit/P/01 - QNM3 English Language and Literature":
        "PGT/M1073/M7PENLLL/P/01",
    "MA English Language & Lit/P/02 - QNM3 English Language and Literature":
        "PGT/M1073/M7PENLLL/P/02",
    "MA English Language & Lit/P/03 - QNM3 English Language and Literature":
        "PGT/M1073/M7PENLLL/P/03",
    "MA English Language & Lit/P/04 - QNM3 English Language and Literature":
        "PGT/M1073/M7PENLLL/P/04",
    "MA English w Creative Writing/F/01 - QNM4 English with Creative Writing":
        "PGT/M1076/M7PENLCW/F/01",
    "MA English w Creative Writing/P/01 - QNM4 English with Creative Writing":
        "PGT/M1076/M7PENLCW/P/01",
    "MA English w Creative Writing/P/02 - QNM4 English with Creative Writing":
        "PGT/M1076/M7PENLCW/P/02",
    "MA English w Creative Writing/P/03 - QNM4 English with Creative Writing":
        "PGT/M1076/M7PENLCW/P/03",
    "MA English w Creative Writing/P/04 - QNM4 English with Creative Writing":
        "PGT/M1076/M7PENLCW/P/04"
  },
  "MSC-MLC": {
    "BA Hons IntComSt w Eng L & L/F/01 - PNM2 International Communication Studies with English Language and Literature":
        "UG/M1018/M6UICELL/F/01",
    "BA Hons IntComSt w Eng L & L/F/02 - PNM2 International Communication Studies with English Language and Literature":
        "UG/M1018/M6UICELL/F/02",
    "BA Hons IntComSt w Eng L & L/F/03 - PNM2 International Communication Studies with English Language and Literature":
        "UG/M1018/M6UICELL/F/03",
    "BA Hons IntComSt w Film & TV/F/01 - PNM1 International Communication Studies with Film and Television Studies":
        "UG/M1018/M6UICFTV/F/01",
    "BA Hons IntComSt w Film & TV/F/02 - PNM1 International Communication Studies with Film and Television Studies":
        "UG/M1018/M6UICFTV/F/02",
    "BA Hons IntComSt w Film & TV/F/03 - PNM1 International Communication Studies with Film and Television Studies":
        "UG/M1018/M6UICFTV/F/03",
    "BA Hons IntlCommSt wt Pfr Arts/F/01 - Intl Comm International Communications Studies with Performing Arts":
        "UG/M1279/M6UICPAT/F/01",
    "BA Hons IntlCommSt wt Pfr Arts/F/02 - Intl Comm International Communications Studies with Performing Arts":
        "UG/M1279/M6UICPAT/F/02",
    "BA Hons IntlCommSt wt Pfr Arts/F/03 - Intl Comm International Communications Studies with Performing Arts":
        "UG/M1279/M6UICPAT/F/03",
    "BA Hons Intnl Communication St/F/01 - P900 International Communication Studies":
        "UG/M1018/M6UINTCS/F/01",
    "BA Hons Intnl Communication St/F/02 - P900 International Communication Studies":
        "UG/M1018/M6UINTCS/F/02",
    "BA Hons Intnl Communication St/F/03 - P900 International Communication Studies":
        "UG/M1018/M6UINTCS/F/03",
    "BA Hons Liberal Arts/F/01 - Liberal Ar Liberal Arts":
        "UG/M1280/M6ULIBAT/F/01",
    "BA Hons Liberal Arts/F/02 - Liberal Ar Liberal Arts":
        "UG/M1280/M6ULIBAT/F/02",
    "BA Hons Liberal Arts/F/03 - Liberal Ar Liberal Arts":
        "UG/M1280/M6ULIBAT/F/03",
    "IntCmsSt w/EngL&L Shrt Crs/F/01 - SU03 International Communications Studies with English Language and Literature":
        "UG/M1018/M6UICSEL/F/01",
    "IntCmsSt w/EngL&L Shrt Crs/F/02 - SU03 International Communications Studies with English Language and Literature":
        "UG/M1018/M6UICSEL/F/02",
    "IntCmsSt w/EngL&L Shrt Crs/F/03 - SU03 International Communications Studies with English Language and Literature":
        "UG/M1018/M6UICSEL/F/03",
    "IntCom w Film & TV SC/F/01 - PNM1 International Communication Studies with Film and Television Studies":
        "UG/M1018/M6UICFTVS/F/01",
    "IntCom w Film & TV SC/F/02 - PNM1 International Communication Studies with Film and Television Studies":
        "UG/M1018/M6UICFTVS/F/02",
    "IntCom w Film & TV SC/F/03 - PNM1 International Communication Studies with Film and Television Studies":
        "UG/M1018/M6UICFTVS/F/03",
    "Intnl Comm St ShCrs/F/01 - SU07 International Communications Studies":
        "UG/M1018/M6UINTCS3/F/01",
    "Intnl Comm St ShCrs/F/02 - SU07 International Communications Studies":
        "UG/M1018/M6UINTCS3/F/02",
    "Intnl Comm St ShCrs/F/03 - SU07 International Communications Studies":
        "UG/M1018/M6UINTCS3/F/03",
    "MA Media, Comm and Culture/F/01 - L30B Media, Communications and Culture":
        "PGT/M1062/M7PCTSST/F/01",
    "MA Media, Comm and Culture/P/01 - L30B Media, Communications and Culture":
        "PGT/M1281/M7PCTSSTFP/P/01",
    "MA Media, Comm and Culture/P/02 - L30B Media, Communications and Culture":
        "PGT/M1281/M7PCTSSTFP/P/02",
    "MA Media, Comm and Culture/P/03 - L30B Media, Communications and Culture":
        "PGT/M1281/M7PCTSSTFP/P/03",
    "MA Media, Comm and Culture/P/04 - L30B Media, Communications and Culture":
        "PGT/M1281/M7PCTSSTFP/P/04"
  },
  "MSC-PHIR": {
    "BA Hons Intnl Relations/F/01 - L254 International Relations":
        "UG/M1234/M6UINRELM/F/01",
    "BA Hons Intnl Relations/F/02 - L254 International Relations":
        "UG/M1234/M6UINRELM/F/02",
    "BA Hons Intnl Relations/F/03 - L254 International Relations":
        "UG/M1234/M6UINRELM/F/03",
    "BA Hons Intnl Rels w French/F/01 - LNM1 International Relations with French":
        "UG/M1234/M6UIRFRNM/F/01",
    "BA Hons Intnl Rels w French/F/02 - LNM1 International Relations with French":
        "UG/M1234/M6UIRFRNM/F/02",
    "BA Hons Intnl Rels w French/F/03 - LNM1 International Relations with French":
        "UG/M1234/M6UIRFRNM/F/03",
    "BA Hons Intnl Rels w Spanish/F/01 - LNM2 International Relations with Spanish":
        "UG/M1234/M6UIRSPNM/F/01",
    "BA Hons Intnl Rels w Spanish/F/02 - LNM2 International Relations with Spanish":
        "UG/M1234/M6UIRSPNM/F/02",
    "BA Hons Intnl Rels w Spanish/F/03 - LNM2 International Relations with Spanish":
        "UG/M1234/M6UIRSPNM/F/03",
    "International Rel Short Course/F/01 - SU06 International Relations":
        "UG/M1021/M6UINTRL/F/01",
    "International Rel Short Course/F/02 - SU06 International Relations":
        "UG/M1021/M6UINTRL/F/02",
    "International Rel Short Course/F/03 - SU06 International Relations":
        "UG/M1021/M6UINTRL/F/03",
    "Intn't Rel w/ French Shrt Crs/F/01 - SU08 International Relations with French":
        "UG/M1021/M6UINTRF/F/01",
    "Intn't Rel w/ French Shrt Crs/F/02 - SU08 International Relations with French":
        "UG/M1021/M6UINTRF/F/02",
    "Intn't Rel w/ French Shrt Crs/F/03 - SU08 International Relations with French":
        "UG/M1021/M6UINTRF/F/03",
    "IntnlRelnsw/Span ShCrs/F/01 - SU05 International Relations with Spanish":
        "UG/M1021/M6UINTRS/F/01",
    "IntnlRelnsw/Span ShCrs/F/02 - SU05 International Relations with Spanish":
        "UG/M1021/M6UINTRS/F/02",
    "IntnlRelnsw/Span ShCrs/F/03 - SU05 International Relations with Spanish":
        "UG/M1021/M6UINTRS/F/03",
    "MA Intnl Relations/F/01 - L250 International Relations":
        "PGT/M1042/M7PINREL/F/01",
    "MA Intnl Relations/P/01 - L250 International Relations":
        "PGT/M1042/M7PINREL/P/01",
    "MA Intnl Relations/P/02 - L250 International Relations":
        "PGT/M1042/M7PINREL/P/02",
    "MA Intnl Relations/P/03 - L250 International Relations":
        "PGT/M1042/M7PINREL/P/03",
    "MA Intnl Relations/P/04 - L250 International Relations":
        "PGT/M1042/M7PINREL/P/04",
    "MSc Intnl Development Mgmt/F/01 - LNM7 International Development Management":
        "PGT/M1053/M7PINTDM/F/01",
    "MSc Intnl Development Mgmt/P/01 - LNM7 International Development Management":
        "PGT/M1053/M7PINTDM/P/01",
    "MSc Intnl Development Mgmt/P/02 - LNM7 International Development Management":
        "PGT/M1053/M7PINTDM/P/02",
    "MSc Intnl Development Mgmt/P/03 - LNM7 International Development Management":
        "PGT/M1053/M7PINTDM/P/03",
    "MSc Intnl Development Mgmt/P/04 - LNM7 International Development Management":
        "PGT/M1053/M7PINTDM/P/04"
  },
  "MSC-CEE": {
    "BEng Hons Chem Eng w Env Eng/F/01 - H8HF Chemical Engineering with Environmental Engineering":
        "UG/M1221/M6UCEEVEF/F/01",
    "BEng Hons Chem Eng w Env Eng/F/02 - H8HF Chemical Engineering with Environmental Engineering":
        "UG/M1221/M6UCEEVEF/F/02",
    "BEng Hons Chem Eng w Env Eng/F/03 - H8HF Chemical Engineering with Environmental Engineering":
        "UG/M1221/M6UCEEVEF/F/03",
    "BEng Hons Chemical Engineering/F/01 - H810 Chemical Engineering":
        "UG/M1221/M6UCHENGF/F/01",
    "BEng Hons Chemical Engineering/F/02 - H810 Chemical Engineering":
        "UG/M1221/M6UCHENGF/F/02",
    "BEng Hons Chemical Engineering/F/03 - H810 Chemical Engineering":
        "UG/M1221/M6UCHENGF/F/03",
    "MEng Hons Chem Eng w Env Eng/F/01 - H8H2 Chemical Engineering with Environmental Engineering":
        "UG/M1100/M7UCEEVE/F/01",
    "MEng Hons Chem Eng w Env Eng/F/02 - H8H2 Chemical Engineering with Environmental Engineering":
        "UG/M1100/M7UCEEVE/F/02",
    "MEng Hons Chem Eng w Env Eng/F/03 - H8H2 Chemical Engineering with Environmental Engineering":
        "UG/M1100/M7UCEEVE/F/03",
    "MEng Hons Chem Eng w Env Eng/F/04 - H8H2 Chemical Engineering with Environmental Engineering":
        "UG/M1100/M7UCEEVE/F/04",
    "MEng Hons Chemical Engineering/F/01 - H800 Chemical Engineering":
        "UG/M1099/M7UCHENG/F/01",
    "MEng Hons Chemical Engineering/F/02 - H800 Chemical Engineering":
        "UG/M1099/M7UCHENG/F/02",
    "MEng Hons Chemical Engineering/F/03 - H800 Chemical Engineering":
        "UG/M1099/M7UCHENG/F/03",
    "MEng Hons Chemical Engineering/F/04 - H800 Chemical Engineering":
        "UG/M1099/M7UCHENG/F/04",
    "MSc Chemical Engineering/F/01 - H804 Chemical Engineering":
        "PGT/M1222/M7PCHENGF/F/01",
    "MSc Chemical Engineering/P/01 - H804 Chemical Engineering":
        "PGT/M1222/M7PCHENGFP/P/01",
    "MSc Chemical Engineering/P/02 - H804 Chemical Engineering":
        "PGT/M1222/M7PCHENGFP/P/02",
    "MSc Chemical Engineering/P/03 - H804 Chemical Engineering":
        "PGT/M1222/M7PCHENGFP/P/03",
    "MSc Chemical Engineering/P/04 - H804 Chemical Engineering":
        "PGT/M1222/M7PCHENGFP/P/04",
    "MSc Environmental Engineering/F/01 - H22C Environmental Engineering":
        "PGT/M1223/M7PEVENGF/F/01",
    "MSc Environmental Engineering/P/01 - H22C Environmental Engineering":
        "PGT/M1223/M7PEVENGFP/P/01",
    "MSc Environmental Engineering/P/02 - H22C Environmental Engineering":
        "PGT/M1223/M7PEVENGFP/P/02",
    "MSc Environmental Engineering/P/03 - H22C Environmental Engineering":
        "PGT/M1223/M7PEVENGFP/P/03",
    "MSc Environmental Engineering/P/04 - H22C Environmental Engineering":
        "PGT/M1223/M7PEVENGFP/P/04"
  },
  "MSC-CIVE": {
    "BEng Hons Civil Engineering/F/01 - H201 Civil Engineering":
        "UG/M1101/M6UCVENG/F/01",
    "BEng Hons Civil Engineering/F/02 - H201 Civil Engineering":
        "UG/M1101/M6UCVENG/F/02",
    "BEng Hons Civil Engineering/F/03 - H201 Civil Engineering":
        "UG/M1101/M6UCVENG/F/03",
    "MEng Hons Civil Engineering/F/01 - H200 Civil Engineering":
        "UG/M1101/M7UCVENG/F/01",
    "MEng Hons Civil Engineering/F/02 - H200 Civil Engineering":
        "UG/M1101/M7UCVENG/F/02",
    "MEng Hons Civil Engineering/F/03 - H200 Civil Engineering":
        "UG/M1101/M7UCVENG/F/03",
    "MEng Hons Civil Engineering/F/04 - H200 Civil Engineering":
        "UG/M1101/M7UCVENG/F/04",
    "MSc Civil Engineering/F/01 - H293 Civil Engineering":
        "PGT/M1048/M7PCVENG/F/01"
  },
  "MSC-EEE": {
    "BEng Hons Electl & Electnc Eng/F/01 - H603 Electrical and Electronic Engineering":
        "UG/M1024/M6UEEENG/F/01",
    "BEng Hons Electl & Electnc Eng/F/02 - H603 Electrical and Electronic Engineering":
        "UG/M1024/M6UEEENG/F/02",
    "BEng Hons Electl & Electnc Eng/F/03 - H603 Electrical and Electronic Engineering":
        "UG/M1024/M6UEEENG/F/03",
    "BEng Hons Mechatronic Eng/F/01 - HNM5 Mechatronic Engineering":
        "UG/M1027/M6UMTENG/F/01",
    "BEng Hons Mechatronic Eng/F/02 - HNM5 Mechatronic Engineering":
        "UG/M1027/M6UMTENG/F/02",
    "BEng Hons Mechatronic Eng/F/03 - HNM5 Mechatronic Engineering":
        "UG/M1027/M6UMTENG/F/03",
    "MEng Hons Electl & Electnc Eng/F/01 - H600 Electrical and Electronic Engineering":
        "UG/M1024/M7UEEENG/F/01",
    "MEng Hons Electl & Electnc Eng/F/02 - H600 Electrical and Electronic Engineering":
        "UG/M1024/M7UEEENG/F/02",
    "MEng Hons Electl & Electnc Eng/F/03 - H600 Electrical and Electronic Engineering":
        "UG/M1024/M7UEEENG/F/03",
    "MEng Hons Electl & Electnc Eng/F/04 - H600 Electrical and Electronic Engineering":
        "UG/M1024/M7UEEENG/F/04",
    "MEng Hons Mechatronic Eng/F/01 - HNM5 Mechatronic Engineering":
        "UG/M1027/M7UMTENG/F/01",
    "MEng Hons Mechatronic Eng/F/02 - HNM5 Mechatronic Engineering":
        "UG/M1027/M7UMTENG/F/02",
    "MEng Hons Mechatronic Eng/F/03 - HNM5 Mechatronic Engineering":
        "UG/M1027/M7UMTENG/F/03",
    "MEng Hons Mechatronic Eng/F/04 - HNM5 Mechatronic Engineering":
        "UG/M1027/M7UMTENG/F/04",
    "MSc Electrical&Electronic Eng/F/01 - H60F Electrical and Electronic Engineering":
        "PGT/M1272/M7PEEENG/F/01",
    "Mechatronic Eng Short Crs/F/01 - HNM5 Mechatronic Engineering":
        "UG/M1027/M7UMTENGSC/F/01",
    "Mechatronic Eng Short Crs/F/02 - HNM5 Mechatronic Engineering":
        "UG/M1027/M7UMTENGSC/F/02",
    "Mechatronic Eng Short Crs/F/03 - HNM5 Mechatronic Engineering":
        "UG/M1027/M7UMTENGSC/F/03",
    "Mechatronic Eng Short Crs/F/04 - HNM5 Mechatronic Engineering":
        "UG/M1027/M7UMTENGSC/F/04"
  },
  "MSC-MMME": {
    "BEng Hons Mechanical Eng/F/01 - H302 Mechanical Engineering":
        "UG/M1026/M6UMCENG/F/01",
    "BEng Hons Mechanical Eng/F/02 - H302 Mechanical Engineering":
        "UG/M1026/M6UMCENG/F/02",
    "BEng Hons Mechanical Eng/F/03 - H302 Mechanical Engineering":
        "UG/M1026/M6UMCENG/F/03",
    "MEng Hons Mechanical Eng/F/01 - H300 Mechanical Engineering":
        "UG/M1026/M7UMCENG/F/01",
    "MEng Hons Mechanical Eng/F/02 - H300 Mechanical Engineering":
        "UG/M1026/M7UMCENG/F/02",
    "MEng Hons Mechanical Eng/F/03 - H300 Mechanical Engineering":
        "UG/M1026/M7UMCENG/F/03",
    "MEng Hons Mechanical Eng/F/04 - H300 Mechanical Engineering":
        "UG/M1026/M7UMCENG/F/04",
    "MSc Mechanical Engineering/F/01 - H303 Mechanical Engineering":
        "PGT/M1110/M7PMCENG/F/01"
  },
  "MSC-APPPSY": {
    "BSc Hons App Psych & Mgmt/F/01 - CM01 Applied Psychology and Management":
        "UG/M1028/M6UAPPMS/F/01",
    "BSc Hons App Psych & Mgmt/F/02 - CM01 Applied Psychology and Management":
        "UG/M1028/M6UAPPMS/F/02",
    "BSc Hons App Psych & Mgmt/F/03 - CM01 Applied Psychology and Management":
        "UG/M1028/M6UAPPMS/F/03",
    "MSc Management Psychology/F/01 - C890 Management Psychology":
        "PGT/M1109/M7PMGTPS/F/01",
    "MSc Management Psychology/P/01 - C890 Management Psychology":
        "PGT/M1109/M7PMGTPS/P/01",
    "MSc Management Psychology/P/02 - C890 Management Psychology":
        "PGT/M1109/M7PMGTPS/P/02",
    "MSc Management Psychology/P/03 - C890 Management Psychology":
        "PGT/M1109/M7PMGTPS/P/03",
    "MSc Occ Hlth & Safety Leadshp/F/01 - C81A Occupational Health and Safety Leadership":
        "PGT/M1111/M7POCHSL/F/01",
    "MSc Occ Hlth & Safety Leadshp/P/01 - C81A Occupational Health and Safety Leadership":
        "PGT/M1111/M7POCHSL/P/01",
    "MSc Occ Hlth & Safety Leadshp/P/02 - C81A Occupational Health and Safety Leadership":
        "PGT/M1111/M7POCHSL/P/02",
    "MSc Occ Hlth & Safety Leadshp/P/03 - C81A Occupational Health and Safety Leadership":
        "PGT/M1111/M7POCHSL/P/03"
  },
  "MSC-BIOMED": {
    "BSc Hons Biomedical Sci (2+1)/F/01 - BNM2 Biomedical Sciences":
        "UG/M1029/M6UBMEDSM2/F/01",
    "BSc Hons Biomedical Sci (2+1)/F/02 - BNM2 Biomedical Sciences":
        "UG/M1029/M6UBMEDSM2/F/02",
    "BSc Hons Biomedical Sci (2+1)/F/03 - BNM2 Biomedical Sciences":
        "UG/M1029/M6UBMEDSM2/F/03",
    "BSc Hons Biomedical Sciences/F/01 - BNM2 Biomedical Sciences":
        "UG/M1029/M6UBMEDS4/F/01",
    "BSc Hons Biomedical Sciences/F/02 - BNM2 Biomedical Sciences":
        "UG/M1029/M6UBMEDS4/F/02",
    "BSc Hons Biomedical Sciences/F/03 - BNM2 Biomedical Sciences":
        "UG/M1029/M6UBMEDS4/F/03",
    "Biomedical Sciences Short Crs/F/01 - BNM2 Biomedical Sciences":
        "UG/M1029/M6UBMEDC4/F/01",
    "Biomedical Sciences Short Crs/F/02 - BNM2 Biomedical Sciences":
        "UG/M1029/M6UBMEDC4/F/02",
    "Biomedical Sciences Short Crs/F/03 - BNM2 Biomedical Sciences":
        "UG/M1029/M6UBMEDC4/F/03"
  },
  "MSC-BIOSCI": {
    "BSc Hons Biotechnology/F/01 - J700 Biotechnology":
        "UG/M1030/M6UBTECH/F/01",
    "BSc Hons Biotechnology/F/02 - J700 Biotechnology":
        "UG/M1030/M6UBTECH/F/02",
    "BSc Hons Biotechnology/F/03 - J700 Biotechnology":
        "UG/M1030/M6UBTECH/F/03",
    "BSc Hons Nutrition/F/01 - B400 Nutrition": "UG/M1034/M6UNUTRN5/F/01",
    "BSc Hons Nutrition/F/02 - B400 Nutrition": "UG/M1034/M6UNUTRN5/F/02",
    "BSc Hons Nutrition/F/03 - B400 Nutrition": "UG/M1034/M6UNUTRN5/F/03",
    "MSc Biotechnology/F/01 - MSc Biotechnology": "PGT/M1235/M7PBTECH/F/01",
    "MSc Biotechnology/P/01 - DNM3 Biotechnology": "PGT/M1235/M7PBTECHP/P/01",
    "MSc Biotechnology/P/02 - DNM3 Biotechnology": "PGT/M1235/M7PBTECHP/P/02",
    "MSc Biotechnology/P/03 - DNM3 Biotechnology": "PGT/M1235/M7PBTECHP/P/03",
    "MSc Biotechnology/P/04 - DNM3 Biotechnology": "PGT/M1235/M7PBTECHP/P/04",
    "Nutrition Short Course/F/01 - B400 Nutrition": "UG/M1034/M6UNUTRSC5/F/01",
    "Nutrition Short Course/F/02 - B400 Nutrition": "UG/M1034/M6UNUTRSC5/F/02",
    "Nutrition Short Course/F/03 - B400 Nutrition": "UG/M1034/M6UNUTRSC5/F/03"
  },
  "MSC-NUBS": {
    "BSc Hons Business Econ & Mgmt/F/01 - NB02 Business Economics and Management":
        "UG/M1228/M6UBSECMSM/F/01",
    "BSc Hons Business Econ & Mgmt/F/02 - NB02 Business Economics and Management":
        "UG/M1228/M6UBSECMSM/F/02",
    "BSc Hons Business Econ & Mgmt/F/03 - NB02 Business Economics and Management":
        "UG/M1228/M6UBSECMSM/F/03",
    "BSc Hons Business Econ&Finance/F/01 - NB05 Business Economics and Finance":
        "UG/M1227/M6UBSECFSM/F/01",
    "BSc Hons Business Econ&Finance/F/02 - NB05 Business Economics and Finance":
        "UG/M1227/M6UBSECFSM/F/02",
    "BSc Hons Business Econ&Finance/F/03 - NB05 Business Economics and Finance":
        "UG/M1227/M6UBSECFSM/F/03",
    "BSc Hons Fin, Mgt & Busi Ana/F/01 - BSc Hons F Finance, Management and Business Analytics":
        "UG/M1287/M6UFMGBA/F/01",
    "BSc Hons Fin, Mgt & Busi Ana/F/02 - BSc Hons F Finance, Management and Business Analytics":
        "UG/M1287/M6UFMGBA/F/02",
    "BSc Hons Fin, Mgt & Busi Ana/F/03 - BSc Hons F Finance, Management and Business Analytics":
        "UG/M1287/M6UFMGBA/F/03",
    "BSc Hons Finance, Acc'ng &Mgmt/F/01 - NB04 Finance, Accounting and Management":
        "UG/M1226/M6UFAMGTSM/F/01",
    "BSc Hons Finance, Acc'ng &Mgmt/F/02 - NB04 Finance, Accounting and Management":
        "UG/M1226/M6UFAMGTSM/F/02",
    "BSc Hons Finance, Acc'ng &Mgmt/F/03 - NB04 Finance, Accounting and Management":
        "UG/M1226/M6UFAMGTSM/F/03",
    "BSc Hons Intn'l Business Mgmt/F/01 - NB03 International Business Management":
        "UG/M1229/M6UINTBMSM/F/01",
    "BSc Hons Intn'l Business Mgmt/F/02 - NB03 International Business Management":
        "UG/M1229/M6UINTBMSM/F/02",
    "BSc Hons Intn'l Business Mgmt/F/03 - NB03 International Business Management":
        "UG/M1229/M6UINTBMSM/F/03",
    "BSc Hons Management/F/01 - NB01 Management": "UG/M1230/M6UMANAGM/F/01",
    "BSc Hons Management/F/02 - NB01 Management": "UG/M1230/M6UMANAGM/F/02",
    "BSc Hons Management/F/03 - NB01 Management": "UG/M1230/M6UMANAGM/F/03",
    "BSc Hons Mkt & Mgmt/F/01 - BSc Hons M Marketing and Management":
        "UG/M1286/M6UMKTMG/F/01",
    "BSc Hons Mkt & Mgmt/F/02 - BSc Hons M Marketing and Management":
        "UG/M1286/M6UMKTMG/F/02",
    "BSc Hons Mkt & Mgmt/F/03 - BSc Hons M Marketing and Management":
        "UG/M1286/M6UMKTMG/F/03",
    "Bus Econ&Finance Short Course/F/01 - NNM5 Business Economics and Finance":
        "UG/M1013/M6UBUSEFSC/F/01",
    "Bus Econ&Finance Short Course/F/02 - NNM5 Business Economics and Finance":
        "UG/M1013/M6UBUSEFSC/F/02",
    "Bus Econ&Finance Short Course/F/03 - NNM5 Business Economics and Finance":
        "UG/M1013/M6UBUSEFSC/F/03",
    "Intn'l Busi Mgmt Short Course/F/01 - NB03 International Business Management":
        "UG/M1017/M6UINTBMSC/F/01",
    "Intn'l Busi Mgmt Short Course/F/02 - NB03 International Business Management":
        "UG/M1017/M6UINTBMSC/F/02",
    "Intn'l Busi Mgmt Short Course/F/03 - NB03 International Business Management":
        "UG/M1017/M6UINTBMSC/F/03",
    "MBA Business Admin (PSBA)/F/01 - N10T Business Administration":
        "PGT/M1045/M7PBADMTP/F/01",
    "MBA Business Administration/F/01 - N10T Business Administration":
        "PGT/M1250/M7PBAMTMSF/F/01",
    "MBA Business Administration/P/01 - N10T Business Administration":
        "PGT/M1277/M7PBAMTMJP/P/01",
    "MBA Business Administration/P/02 - N10T Business Administration":
        "PGT/M1277/M7PBAMTMJP/P/02",
    "MBA Business Administration/P/03 - N10T Business Administration":
        "PGT/M1277/M7PBAMTMJP/P/03",
    "MBA Business Administration/P/04 - N10T Business Administration":
        "PGT/M1277/M7PBAMTMJP/P/04",
    "MBA BusinessAdmin in Fin(PSBA)/F/01 - N302 Finance":
        "PGT/M1045/M7PMBABAP/F/01",
    "MBA Finance/F/01 - N302 Finance": "PGT/M1251/M7PMBAFMSF/F/01",
    "MBA Finance/P/01 - N302 Finance": "PGT/M1278/M7PMBAFMJP/P/01",
    "MBA Finance/P/02 - N302 Finance": "PGT/M1278/M7PMBAFMJP/P/02",
    "MBA Finance/P/03 - N302 Finance": "PGT/M1278/M7PMBAFMJP/P/03",
    "MBA Finance/P/04 - N302 Finance": "PGT/M1278/M7PMBAFMJP/P/04",
    "MSc Business and Management/F/01 - NN1A Business and Management":
        "PGT/M1134/M7PBUSMA/F/01",
    "MSc Finance & Investment/F/01 - N323 Finance and Investment":
        "PGT/M1248/M7PFNIVMSF/F/01",
    "MSc Finance & Investment/P/01 - N323 Finance and Investment":
        "PGT/M1273/M7PFNIVMFP/P/01",
    "MSc Finance & Investment/P/02 - N323 Finance and Investment":
        "PGT/M1273/M7PFNIVMFP/P/02",
    "MSc Finance & Investment/P/03 - N323 Finance and Investment":
        "PGT/M1273/M7PFNIVMFP/P/03",
    "MSc Finance & Investment/P/04 - N323 Finance and Investment":
        "PGT/M1273/M7PFNIVMFP/P/04",
    "MSc Professional Accountancy/F/01 - N1M1 Professional Accountancy":
        "PGT/M1249/M7PPRACMSF/F/01",
    "MSc Professional Accountancy/P/01 - N1M1 Professional Accountancy":
        "PGT/M1274/M7PPRACMFP/P/01",
    "MSc Professional Accountancy/P/02 - N1M1 Professional Accountancy":
        "PGT/M1274/M7PPRACMFP/P/02",
    "MSc Professional Accountancy/P/03 - N1M1 Professional Accountancy":
        "PGT/M1274/M7PPRACMFP/P/03",
    "MSc Professional Accountancy/P/04 - N1M1 Professional Accountancy":
        "PGT/M1274/M7PPRACMFP/P/04"
  },
  "MSC-CS": {
    "BSc Hons Comp Sci with AI 3+0/F/01 - G4G7 Computer Science with Artificial Intelligence":
        "UG/M1059/M6UCOMPAI/F/01",
    "BSc Hons Comp Sci with AI 3+0/F/02 - G4G7 Computer Science with Artificial Intelligence":
        "UG/M1059/M6UCOMPAI/F/02",
    "BSc Hons Comp Sci with AI 3+0/F/03 - G4G7 Computer Science with Artificial Intelligence":
        "UG/M1059/M6UCOMPAI/F/03",
    "BSc Hons Comp Sci with AI/F/01 - G4G7 Computer Science with Artificial Intelligence":
        "UG/M1059/M6UCMPAI/F/01",
    "BSc Hons Comp Sci with AI/F/02 - G4G7 Computer Science with Artificial Intelligence":
        "UG/M1059/M6UCMPAI/F/02",
    "BSc Hons Computer Science/F/01 - G400 Computer Science":
        "UG/M1059/M6UCMPSC/F/01",
    "BSc Hons Computer Science/F/02 - G400 Computer Science":
        "UG/M1059/M6UCMPSC/F/02",
    "BSc Hons Computer Science/F/03 - G400 Computer Science":
        "UG/M1059/M6UCMPSC/F/03",
    "BSc Hons Software Engineering/F/01 - G601 Software Engineering":
        "UG/M1039/M6USWENG/F/01",
    "BSc Hons Software Engineering/F/02 - G601 Software Engineering":
        "UG/M1039/M6USWENG/F/02",
    "BSc Hons Software Engineering/F/03 - G601 Software Engineering":
        "UG/M1039/M6USWENG/F/03",
    "Computer Science Short Course/F/01 - SU01 Computer Science":
        "UG/M1125/M6UCOSSC3/F/01",
    "Computer Science Short Course/F/02 - SU01 Computer Science":
        "UG/M1125/M6UCOSSC3/F/02",
    "Computer Science Short Course/F/03 - SU01 Computer Science":
        "UG/M1125/M6UCOSSC3/F/03",
    "MSc Computer Science/F/01 - G405 Computer Science":
        "PGT/M1198/M7PCOMPSC/F/01",
    "Software Engineering Short Crs/F/01 - G601 Software Engineering":
        "UG/M1039/M6USWENGSC/F/01",
    "Software Engineering Short Crs/F/02 - G601 Software Engineering":
        "UG/M1039/M6USWENGSC/F/02",
    "Software Engineering Short Crs/F/03 - G601 Software Engineering":
        "UG/M1039/M6USWENGSC/F/03"
  },
  "MSC-ECON": {
    "BSc Hons Economics/F/01 - L100 Economics": "UG/M1232/M6UECNMSM/F/01",
    "BSc Hons Economics/F/02 - L100 Economics": "UG/M1232/M6UECNMSM/F/02",
    "BSc Hons Economics/F/03 - L100 Economics": "UG/M1232/M6UECNMSM/F/03",
    "BSc Hons Econs & Int Econs/F/01 - L160 Economics and International Economics":
        "UG/M1231/M6UECOIEM/F/01",
    "BSc Hons Econs & Int Econs/F/02 - L160 Economics and International Economics":
        "UG/M1231/M6UECOIEM/F/02",
    "BSc Hons Econs & Int Econs/F/03 - L160 Economics and International Economics":
        "UG/M1231/M6UECOIEM/F/03"
  },
  "MSC-GEOG": {
    "BSc Hons Environmental Science/F/01 - F900 Environmental Science":
        "UG/M1033/M6UEVNSC/F/01",
    "BSc Hons Environmental Science/F/02 - F900 Environmental Science":
        "UG/M1033/M6UEVNSC/F/02",
    "BSc Hons Environmental Science/F/03 - F900 Environmental Science":
        "UG/M1033/M6UEVNSC/F/03"
  },
  "MSC-AMATH": {
    "BSc Hons Mathematics & Data Science/F/01 - Mathematics and Data Science":
        "UG/M1285/M6UMATHDS/F/01",
    "BSc Hons Maths & Data Sc/F/02 - BSc Hons M Mathematics and Data Science":
        "UG/M1285/M6UMATHDS/F/02",
    "BSc Hons Maths & Data Sc/F/03 - BSc Hons M Mathematics and Data Science":
        "UG/M1285/M6UMATHDS/F/03",
    "BSc Hons Maths & Management/F/01 - NB08 Mathematics and Management":
        "UG/M1197/M6UBSMMGT/F/01",
    "BSc Hons Maths & Management/F/02 - NB08 Mathematics and Management":
        "UG/M1197/M6UBSMMGT/F/02",
    "BSc Hons Maths & Management/F/03 - NB08 Mathematics and Management":
        "UG/M1197/M6UBSMMGT/F/03"
  },
  "MSC-PHARM": {
    "BSc Hons Pharmal & Health Sci/F/01 - BNM1 Pharmaceutical and Health Sciences":
        "UG/M1035/M6UPCTHS/F/01",
    "BSc Hons Pharmal & Health Sci/F/02 - BNM1 Pharmaceutical and Health Sciences":
        "UG/M1035/M6UPCTHS/F/02",
    "BSc Hons Pharmal & Health Sci/F/03 - BNM1 Pharmaceutical and Health Sciences":
        "UG/M1035/M6UPCTHS/F/03",
    "MPharm Pharmacy/F/01 - B230 Pharmacy": "UG/M1092/M7UPHMCY/F/01",
    "MPharm Pharmacy/F/02 - B230 Pharmacy": "UG/M1092/M7UPHMCY/F/02",
    "MPharm Pharmacy/F/03 - B230 Pharmacy": "UG/M1092/M7UPHMCY/F/03",
    "MPharm Pharmacy/F/04 - B230 Pharmacy": "UG/M1092/M7UPHMCY/F/04",
    "MPharm PharmacyA/F/01 - B230 Pharmacy": "UG/M1092/M7UPHMCYA/F/01"
  },
  "MSC-PSGY": {
    "BSc Hons Psych & Cog Neurosci/F/01 - C850 Psychology and Cognitive Neuroscience":
        "UG/M1038/M6UPSYCN/F/01",
    "BSc Hons Psych & Cog Neurosci/F/02 - C850 Psychology and Cognitive Neuroscience":
        "UG/M1038/M6UPSYCN/F/02",
    "BSc Hons Psych & Cog Neurosci/F/03 - C850 Psychology and Cognitive Neuroscience":
        "UG/M1038/M6UPSYCN/F/03",
    "BSc Hons Psychology/F/01 - C800 Psychology": "UG/M1037/M6UPSYCH/F/01",
    "BSc Hons Psychology/F/02 - C800 Psychology": "UG/M1037/M6UPSYCH/F/02",
    "BSc Hons Psychology/F/03 - C800 Psychology": "UG/M1037/M6UPSYCH/F/03",
    "MSc Developmental Disorders/F/01 - MSc Developmental Disorders":
        "PGT/M1288/M7PDEVDO/F/01"
  },
  "MSC-AEF": {
    "Cert Fnd Prog in Arts & Ed/F/00 - FNM5 Foundation Programme in Arts and Education 2 semesters":
        "FND/M1211/M5UFDAET/F/00",
    "Cert Fnd Prog in Arts & Ed/F/00 - FNM5 Foundation Programme in Arts and Education 3 semesters":
        "FND/M1270/M5UFDAEJ/F/00",
    "Cert Fnd Prog in Arts & Ed/F/00 - FNM5 Foundation Programme in Arts and Education":
        "FND/M1212/M5UFDAES/F/00"
  },
  "MSC-BMF": {
    "Cert Fnd Prog in Bus & Mgmt/F/00 - FNM1 Foundation Programme in Business and Management 2 semesters":
        "FND/M1214/M5UFDBMT/F/00",
    "Cert Fnd Prog in Bus & Mgmt/F/00 - FNM1 Foundation Programme in Business and Management 3 semesters":
        "FND/M1271/M5UFDBMJ/F/00",
    "Cert Fnd Prog in Bus & Mgmt/F/00 - FNM1 Foundation Programme in Business and Management":
        "FND/M1215/M5UFDBMS/F/00"
  },
  "MSC-ENGF": {
    "Cert Fnd Prog in Engineering/F/00 - FNM4 Foundation Programme in Engineering 2 semesters":
        "FND/M1218/M5UFDEGT/F/00",
    "Cert Fnd Prog in Engineering/F/00 - FNM4 Foundation Programme in Engineering 3 semester":
        "FND/M1219/M5UFDEGS/F/00",
    "Cert Fnd Prog in Engineering/F/00 - FNM4 Foundation Programme in Engineering 3 semesters":
        "FND/M1217/M5UFDEGJ/F/00"
  },
  "MSC-SCIF": {
    "Cert Foundation in Sci/F/00 - FNM6 Foundation in Science 2 semesters":
        "FND/M1208/M5UFDSCT/F/00",
    "Cert Foundation in Sci/F/00 - FNM6 Foundation in Science 3 semesters":
        "FND/M1282/M5UFDSCJ/F/00",
    "Cert Foundation in Sci/F/00 - FNM6 Foundation in Science":
        "FND/M1209/M5UFDSCS/F/00",
    "Cert Foundation in Sci/F/00 D - FNM6 Foundation in Science":
        "FND/M1078/M5UFNDSC/F/00",
    "Cert Foundation in Sci/F/00D - FNM6 Foundation in Science 3 semesters":
        "FND/M1078/M5UFDTNS/F/00"
  }
};
