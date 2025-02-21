## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.138.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.138.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lamp_instance_preemptible"></a> [lamp\_instance\_preemptible](#module\_lamp\_instance\_preemptible) | ./modules/instance | n/a |
| <a name="module_lemp_instance_preemptible"></a> [lemp\_instance\_preemptible](#module\_lemp\_instance\_preemptible) | ./modules/instance | n/a |
| <a name="module_network_a"></a> [network\_a](#module\_network\_a) | ./modules/network | n/a |
| <a name="module_service_account"></a> [service\_account](#module\_service\_account) | ./modules/service_account | n/a |
| <a name="module_subnetwork_a"></a> [subnetwork\_a](#module\_subnetwork\_a) | ./modules/subnet | n/a |
| <a name="module_subnetwork_b"></a> [subnetwork\_b](#module\_subnetwork\_b) | ./modules/subnet | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_compute_image.lamp](https://registry.terraform.io/providers/yandex-cloud/yandex/0.138.0/docs/data-sources/compute_image) | data source |
| [yandex_compute_image.lemp](https://registry.terraform.io/providers/yandex-cloud/yandex/0.138.0/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | Name of the bucket for storing Terraform state | `string` | `"terraform-state-bucket"` | no |
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | n/a | `string` | `""` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | ID ╨║╨░╤В╨░╨╗╨╛╨│╨░ ╨▓ Yandex Cloud | `string` | `""` | no |
| <a name="input_preemptible"></a> [preemptible](#input\_preemptible) | ╨Я╤А╨╡╤А╤Л╨▓╨░╨╡╨╝╤Л╨╣ ╨╕╨╜╤Б╤В╨░╨╜╤Б | `bool` | `true` | no |
| <a name="input_role"></a> [role](#input\_role) | ╨а╨╛╨╗╤М ╨┤╨╗╤П ╨╜╨░╨╖╨╜╨░╤З╨╡╨╜╨╕╤П ╤Б╨╡╤А╨▓╨╕╤Б╨╜╨╛╨╣ ╤Г╤З╤С╤В╨║╨╡ | `string` | `""` | no |
| <a name="input_sa_name"></a> [sa\_name](#input\_sa\_name) | ╨Ш╨╝╤П ╤Б╨╡╤А╨▓╨╕╤Б╨╜╨╛╨╣ ╤Г╤З╤С╤В╨║╨╕ | `string` | `""` | no |
| <a name="input_service_account_key_file"></a> [service\_account\_key\_file](#input\_service\_account\_key\_file) | Path to the service account key file for Yandex Cloud | `string` | `""` | no |
| <a name="input_static_key_description"></a> [static\_key\_description](#input\_static\_key\_description) | ╨Ю╨┐╨╕╤Б╨░╨╜╨╕╨╡ ╨┤╨╗╤П ╤Б╤В╨░╤В╨╕╤З╨╡╤Б╨║╨╛╨│╨╛ ╨║╨╗╤О╤З╨░ ╨┤╨╛╤Б╤В╤Г╨┐╨░ | `string` | `""` | no |
| <a name="input_storage_access_key"></a> [storage\_access\_key](#input\_storage\_access\_key) | Access key for Yandex Object Storage | `string` | `""` | no |
| <a name="input_storage_secret_key"></a> [storage\_secret\_key](#input\_storage\_secret\_key) | Secret key for Yandex Object Storage | `string` | `""` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | ╨Ш╨╝╤П ╨┐╨╛╨┤╤Б╨╡╤В╨╕ | `string` | `"subnet_name"` | no |
| <a name="input_token"></a> [token](#input\_token) | n/a | `string` | `""` | no |
| <a name="input_user-data"></a> [user-data](#input\_user-data) | ╤Г╤Б╤В╨░╨╜╨╛╨▓╨║╨░ ╨╜╨░ ╤Г╨▒╤Г╨╜╤В╤Г ╨┐╤Л╤Е╨╕,╨╜╨│╨╕╨╜╨║╤Б╨░ ╨╕ ╨╝╤Г╤Б╨║╤Г╨╗╨░ ╨┤╨╗╤П family = ubuntu-2004-lts # ╨Ш╤Б╨┐╨╛╨╗╤М╨╖╤Г╨╡╨╝ ╤Б╨╡╨╝╨╡╨╣╤Б╤В╨▓╨╛ ╨╛╨▒╤А╨░╨╖╨╛╨▓ Ubuntu 20.04 LTS | `string` | `"#cloud-config\r\npackage_update: true\r\npackages:\r\n  - nginx\r\n  - mariadb-server\r\n  - php-fpm\r\n  - php-mysql\r\nruncmd:\r\n  - systemctl enable nginx\r\n  - systemctl start nginx\r\n  - systemctl enable mariadb\r\n  - systemctl start mariadb\r\n  - systemctl enable php7.4-fpm\r\n  - systemctl start php7.4-fpm\r\n  - mysql -e \"CREATE DATABASE lemp_db;\"\r\n  - mysql -e \"CREATE USER 'lemp_user'@'localhost' IDENTIFIED BY 'p@rol';\"\r\n  - mysql -e \"GRANT ALL PRIVILEGES ON lemp_db.* TO 'lemp_user'@'localhost';\"\r\n  - mysql -e \"FLUSH PRIVILEGES;\"\r\n  - echo \"<?php phpinfo(); ?>\" > /var/www/html/index.php\r\n  - chown -R www-data:www-data /var/www/html\r\n  - chmod -R 755 /var/www/html\r\n"` | no |
| <a name="input_v4_cidr_blocks"></a> [v4\_cidr\_blocks](#input\_v4\_cidr\_blocks) | CIDR ╨▒╨╗╨╛╨║╨╕ ╨┤╨╗╤П ╨┐╨╛╨┤╤Б╨╡╤В╨╕ | `list(string)` | <pre>[<br/>  "0.0.0.0/0"<br/>]</pre> | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Use specific availability zone | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address_lamp_server"></a> [external\_ip\_address\_lamp\_server](#output\_external\_ip\_address\_lamp\_server) | n/a |
| <a name="output_external_ip_address_lemp_server"></a> [external\_ip\_address\_lemp\_server](#output\_external\_ip\_address\_lemp\_server) | n/a |
| <a name="output_internal_ip_address_lamp_server"></a> [internal\_ip\_address\_lamp\_server](#output\_internal\_ip\_address\_lamp\_server) | n/a |
| <a name="output_internal_ip_address_lemp_server"></a> [internal\_ip\_address\_lemp\_server](#output\_internal\_ip\_address\_lemp\_server) | n/a |
㰊ⴡ‭䕂䥇彎䙔䑟䍏⁓ⴭਾ⌣删煥極敲敭瑮ੳ簊丠浡⁥⁼敖獲潩⁮੼⵼ⴭⴭ簭ⴭⴭⴭⴭ簭簊㰠⁡慮敭∽敲畱物浥湥彴慹摮硥㸢⼼㹡嬠慹摮硥⡝爣煥極敲敭瑮彜慹摮硥 ⁼⸰㌱⸸‰੼⌊‣牐癯摩牥ੳ簊丠浡⁥⁼敖獲潩⁮੼⵼ⴭⴭ簭ⴭⴭⴭⴭ簭簊㰠⁡慮敭∽牰癯摩牥祟湡敤≸㰾愯‾祛湡敤嵸⌨牰癯摩牥彜慹摮硥 ⁼⸰㌱⸸‰੼⌊‣潍畤敬ੳ簊丠浡⁥⁼潓牵散簠嘠牥楳湯簠簊ⴭⴭⴭ⵼ⴭⴭⴭ簭ⴭⴭⴭⴭ簭簊㰠⁡慮敭∽潭畤敬江浡彰湩瑳湡散灟敲浥瑰扩敬㸢⼼㹡嬠慬灭彜湩瑳湡散彜牰敥灭楴汢嵥⌨潭畤敬彜慬灭彜湩瑳湡散彜牰敥灭楴汢⥥簠⸠洯摯汵獥椯獮慴据⁥⁼⽮⁡੼⁼愼渠浡㵥洢摯汵彥敬灭楟獮慴据彥牰敥灭楴汢≥㰾愯‾汛浥屰楟獮慴据履灟敲浥瑰扩敬⡝洣摯汵履江浥屰楟獮慴据履灟敲浥瑰扩敬 ⁼⼮潭畤敬⽳湩瑳湡散簠渠愯簠簊㰠⁡慮敭∽潭畤敬湟瑥潷歲慟㸢⼼㹡嬠敮睴牯屫慟⡝洣摯汵履湟瑥潷歲彜⥡簠⸠洯摯汵獥港瑥潷歲簠渠愯簠簊㰠⁡慮敭∽潭畤敬獟牥楶散慟捣畯瑮㸢⼼㹡嬠敳癲捩履慟捣畯瑮⡝洣摯汵履獟牥楶散彜捡潣湵⥴簠⸠洯摯汵獥猯牥楶散慟捣畯瑮簠渠愯簠簊㰠⁡慮敭∽潭畤敬獟扵敮睴牯彫≡㰾愯‾獛扵敮睴牯屫慟⡝洣摯汵履獟扵敮睴牯屫慟 ⁼⼮潭畤敬⽳畳湢瑥簠渠愯簠簊㰠⁡慮敭∽潭畤敬獟扵敮睴牯彫≢㰾愯‾獛扵敮睴牯屫扟⡝洣摯汵履獟扵敮睴牯屫扟 ⁼⼮潭畤敬⽳畳湢瑥簠渠愯簠ਊ⌣删獥畯捲獥ਊ⁼慎敭簠吠灹⁥੼⵼ⴭⴭ簭ⴭⴭⴭ੼⁼祛湡敤彸潣灭瑵彥浩条⹥慬灭⡝瑨灴㩳⼯敲楧瑳祲琮牥慲潦浲椮⽯牰癯摩牥⽳慹摮硥挭潬摵礯湡敤⽸⸰㌱⸸⼰潤獣搯瑡ⵡ潳牵散⽳潣灭瑵彥浩条⥥簠搠瑡⁡潳牵散簠簊嬠慹摮硥损浯異整楟慭敧氮浥嵰栨瑴獰⼺爯来獩牴⹹整牲晡牯⹭潩瀯潲楶敤獲礯湡敤⵸汣畯⽤慹摮硥〯ㄮ㠳〮搯捯⽳慤慴猭畯捲獥振浯異整楟慭敧 ⁼慤慴猠畯捲⁥੼⌊‣湉異獴ਊ⁼慎敭簠䐠獥牣灩楴湯簠吠灹⁥⁼敄慦汵⁴⁼敒畱物摥簠簊ⴭⴭⴭ⵼ⴭⴭⴭⴭⴭⴭ⵼ⴭⴭ簭ⴭⴭⴭⴭ簭ⴺⴭⴭⴭ㨭੼⁼愼渠浡㵥椢灮瑵扟捵敫≴㰾愯‾扛捵敫嵴⌨湩異屴扟捵敫⥴簠丠浡⁥景琠敨戠捵敫⁴潦⁲瑳牯湩⁧敔牲晡牯⁭瑳瑡⁥⁼獠牴湩恧簠怠琢牥慲潦浲猭慴整戭捵敫≴⁠⁼潮簠簊㰠⁡慮敭∽湩異彴汣畯彤摩㸢⼼㹡嬠汣畯層楟嵤⌨湩異屴损潬摵彜摩 ⁼⽮⁡⁼獠牴湩恧簠怠∢⁠⁼潮簠簊㰠⁡慮敭∽湩異彴潦摬牥楟≤㰾愯‾晛汯敤屲楟嵤⌨湩異屴晟汯敤屲楟⥤簠䤠⁄뫐냐苑냐믐뻐돐냐퀠₲慙摮硥䌠潬摵簠怠瑳楲杮⁠⁼≠怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵灟敲浥瑰扩敬㸢⼼㹡嬠牰敥灭楴汢嵥⌨湩異屴灟敲浥瑰扩敬 ⁼鿐胑뗐胑译닐냐뗐볐译말퀠킸톽톁킂킰톽₁⁼扠潯恬簠怠牴敵⁠⁼潮簠簊㰠⁡慮敭∽湩異彴潲敬㸢⼼㹡嬠潲敬⡝椣灮瑵彜潲敬 ⁼ꃐ뻐믐賑퀠킴톻₏뷐냐럐뷐냐蟑뗐뷐룐近턠킁통킀킲톸킁킽킾₹菑蟑金苑뫐뗐簠怠瑳楲杮⁠⁼≠怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵獟彡慮敭㸢⼼㹡嬠慳彜慮敭⡝椣灮瑵彜慳彜慮敭 ⁼飐볐近턠킁통킀킲톸킁킽킾₹菑蟑金苑뫐룐簠怠瑳楲杮⁠⁼≠怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵獟牥楶散慟捣畯瑮歟祥晟汩≥㰾愯‾獛牥楶散彜捡潣湵屴歟祥彜楦敬⡝椣灮瑵彜敳癲捩履慟捣畯瑮彜敫屹晟汩⥥簠倠瑡⁨潴琠敨猠牥楶散愠捣畯瑮欠祥映汩⁥潦⁲慙摮硥䌠潬摵簠怠瑳楲杮⁠⁼≠怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵獟慴楴彣敫役敤捳楲瑰潩≮㰾愯‾獛慴楴屣歟祥彜敤捳楲瑰潩嵮⌨湩異屴獟慴楴屣歟祥彜敤捳楲瑰潩⥮簠퀠킞킿톸킁킰킽킸₵듐믐近턠톁킂톰킂톸킇통킁킺킾킳₾뫐믐軑蟑냐퀠킴톾톁톂킃킿₰⁼獠牴湩恧簠怠∢⁠⁼潮簠簊㰠⁡慮敭∽湩異彴瑳牯条彥捡散獳歟祥㸢⼼㹡嬠瑳牯条履慟捣獥屳歟祥⡝椣灮瑵彜瑳牯条履慟捣獥屳歟祥 ⁼捁散獳欠祥映牯夠湡敤⁸扏敪瑣匠潴慲敧簠怠瑳楲杮⁠⁼≠怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵獟潴慲敧獟捥敲彴敫≹㰾愯‾獛潴慲敧彜敳牣瑥彜敫嵹⌨湩異屴獟潴慲敧彜敳牣瑥彜敫⥹簠匠捥敲⁴敫⁹潦⁲慙摮硥传橢捥⁴瑓牯条⁥⁼獠牴湩恧簠怠∢⁠⁼潮簠簊㰠⁡慮敭∽湩異彴畳湢瑥湟浡≥㰾愯‾獛扵敮屴湟浡嵥⌨湩異屴獟扵敮屴湟浡⥥簠퀠킘톼₏뿐뻐듐臑뗐苑룐簠怠瑳楲杮⁠⁼≠畳湢瑥湟浡≥⁠⁼潮簠簊㰠⁡慮敭∽湩異彴潴敫≮㰾愯‾瑛歯湥⡝椣灮瑵彜潴敫⥮簠渠愯簠怠瑳楲杮⁠⁼≠怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵畟敳⵲慤慴㸢⼼㹡嬠獵牥搭瑡嵡⌨湩異屴畟敳⵲慤慴 ⁼菑臑苑냐뷐뻐닐뫐냐퀠킽₰菑뇐菑뷐苑菑퀠톿톋킅Ⲹ뷐돐룐뷐뫐臑냐퀠₸볐菑臑뫐菑믐냐퀠킴톻₏慦業祬㴠甠畢瑮⵵〲㐰氭獴⌠퀠톘킁킿킾톻킌톷킃킵₼臑뗐볐뗐말臑苑닐뻐퀠킾톱킀킰킷킾₲払湵畴㈠⸰㐰䰠協簠怠瑳楲杮⁠⁼≠挣潬摵挭湯楦屧屲灮捡慫敧畟摰瑡㩥琠畲履屲灮捡慫敧㩳牜湜†‭杮湩屸屲⁮ⴠ洠牡慩扤猭牥敶屲屲⁮ⴠ瀠灨昭浰牜湜†‭桰⵰祭煳屬屲牮湵浣㩤牜湜†‭祳瑳浥瑣⁬湥扡敬渠楧确牜湜†‭祳瑳浥瑣⁬瑳牡⁴杮湩屸屲⁮ⴠ猠獹整捭汴攠慮汢⁥慭楲摡屢屲⁮ⴠ猠獹整捭汴猠慴瑲洠牡慩扤牜湜†‭祳瑳浥瑣⁬湥扡敬瀠灨⸷ⴴ灦屭屲⁮ⴠ猠獹整捭汴猠慴瑲瀠灨⸷ⴴ灦屭屲⁮ⴠ洠獹汱ⴠ⁥≜剃䅅䕔䐠呁䉁十⁅敬灭摟㭢≜牜湜†‭祭煳⁬攭尠䌢䕒呁⁅单剅✠敬灭畟敳❲❀潬慣桬獯❴䤠䕄呎䙉䕉⁄奂✠䁰潲❬尻尢屲⁮ⴠ洠獹汱ⴠ⁥≜則乁⁔䱁⁌剐噉䱉䝅卅传⁎敬灭摟⹢‪佔✠敬灭畟敳❲❀潬慣桬獯❴尻尢屲⁮ⴠ洠獹汱ⴠ⁥≜䱆单⁈剐噉䱉䝅卅尻尢屲⁮ⴠ攠档⁯≜㼼桰⁰桰楰普⡯㬩㼠尾•‾瘯牡眯睷栯浴⽬湩敤⹸桰屰屲⁮ⴠ挠潨湷ⴠ⁒睷⵷慤慴眺睷搭瑡⁡瘯牡眯睷栯浴屬屲⁮ⴠ挠浨摯ⴠ⁒㔷‵瘯牡眯睷栯浴屬屲≮⁠⁼潮簠簊㰠⁡慮敭∽湩異彴㑶损摩彲汢捯獫㸢⼼㹡嬠㑶彜楣牤彜汢捯獫⡝椣灮瑵彜㑶彜楣牤彜汢捯獫 ⁼䥃剄퀠킱킻킾킺₸듐믐近퀠킿킾톴킁통킂₸⁼池獩⡴瑳楲杮怩簠㰠牰㹥㱛牢㸯†〢〮〮〮〯㰢牢㸯㱝瀯敲‾⁼潮簠簊㰠⁡慮敭∽湩異彴潺敮㸢⼼㹡嬠潺敮⡝椣灮瑵彜潺敮 ⁼獕⁥灳捥晩捩愠慶汩扡汩瑩⁹潺敮簠怠瑳楲杮⁠⁼≠畲挭湥牴污ⴱ≡⁠⁼潮簠ਊ⌣传瑵異獴ਊ⁼慎敭簠䐠獥牣灩楴湯簠簊ⴭⴭⴭ⵼ⴭⴭⴭⴭⴭⴭ੼⁼愼渠浡㵥漢瑵異彴硥整湲污楟彰摡牤獥彳慬灭獟牥敶≲㰾愯‾敛瑸牥慮屬楟屰慟摤敲獳彜慬灭彜敳癲牥⡝漣瑵異屴敟瑸牥慮屬楟屰慟摤敲獳彜慬灭彜敳癲牥 ⁼⽮⁡੼⁼愼渠浡㵥漢瑵異彴硥整湲污楟彰摡牤獥彳敬灭獟牥敶≲㰾愯‾敛瑸牥慮屬楟屰慟摤敲獳彜敬灭彜敳癲牥⡝漣瑵異屴敟瑸牥慮屬楟屰慟摤敲獳彜敬灭彜敳癲牥 ⁼⽮⁡੼⁼愼渠浡㵥漢瑵異彴湩整湲污楟彰摡牤獥彳慬灭獟牥敶≲㰾愯‾楛瑮牥慮屬楟屰慟摤敲獳彜慬灭彜敳癲牥⡝漣瑵異屴楟瑮牥慮屬楟屰慟摤敲獳彜慬灭彜敳癲牥 ⁼⽮⁡੼⁼愼渠浡㵥漢瑵異彴湩整湲污楟彰摡牤獥彳敬灭獟牥敶≲㰾愯‾楛瑮牥慮屬楟屰慟摤敲獳彜敬灭彜敳癲牥⡝漣瑵異屴楟瑮牥慮屬楟屰慟摤敲獳彜敬灭彜敳癲牥 ⁼⽮⁡੼ℼⴭ䔠䑎呟彆佄千ⴠ㸭