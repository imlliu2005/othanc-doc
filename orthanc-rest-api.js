curl http://localhost:8042/patients
// [
//     "84972ad0-123f9003-e46ac6c7-73212ecf-15cbecd6",
//     "39f7f815-0ed99283-ad04e5fb-e699a3a7-072b29c4"
// ]

curl http://localhost:8042/studies
// [
//     "3d8482fd-b1f914a3-9e1575e6-d4264eb7-f470a992",
//     "03032870-5a704637-c9b48a47-9aa36521-140226a5"
//  ]

curl http://localhost:8042/series
// [
//     "723ea78d-f6aacab4-22200b70-fda60d4b-8252eeb6",
//     "3b59e028-89f8dbf1-c1365c55-df9931da-66ad5742"
//  ]

curl http://localhost:8042/series/723ea78d-f6aacab4-22200b70-fda60d4b-8252eeb6

curl http://localhost:8042/instances
// [
//     "0734be54-7724d779-28825264-e41d57d7-4952f48a",
//     "36d42388-7af38422-e8fca79c-4ccc1c28-a295be43",
//     "e6eec528-afc346f8-bc4f50e9-5660189a-ef7eff5f",
//     "cff98a2b-18e66ed0-31219f14-7ab0e728-e2446450",
//     "5b12a884-29afec9c-c0cbce1a-f338a30b-366569ce",
//     "2b6c39cf-69823dfa-d34d6d02-94cc93b1-402b9299",
//     "c5521d23-e659002d-e6a0d68b-f21039b9-25eae46b",
//     "a998e353-f5c531f7-890b5484-07381c44-33df9251",
//     "4410b6d1-5ed01c39-964724fe-73ac47ba-1e03958a",
//     "0d9e87e9-9f238826-9a5cc1fa-f11532d9-ed122377",
//     "be8a391f-0a544d48-3bbbc2f8-02399dab-156003c3",
//     "3ebe35a2-6041e10b-afb67978-18663d5a-524d623d",
// ]


curl http://localhost:8042/patients/dc65762c-f476e8b9-898834f4-2f8a5014-2599bc94

curl http://localhost:8042/osimis-viewer/images/5a511cc1-a593f571-13107899-54eb2007-55927b66/0/high-quality > 2.png
curl http://localhost:8042/instances/5a511cc1-a593f571-13107899-54eb2007-55927b66/preview > 1.png
curl http://localhost:8042/instances/5a511cc1-a593f571-13107899-54eb2007-55927b66/image-uint16 > full-16.png  
curl http://localhost:8042/instances/5a511cc1-a593f571-13107899-54eb2007-55927b66/image-uint8 > full-8.png  