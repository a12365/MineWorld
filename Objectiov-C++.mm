    OOData xml = OOString( @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

                          "<a>"

                          "  <b attr=\"88\">data1</b>"

                          "  <b attr=\"99\">data2</b>"

                          "</a>" );

    OONode node = xml;

    NSLog( @"value: %@, attribute value: %@",

          **node[@"a"][@"b"], **node[@"a/b/1/@attr"] );

