/*jshint esversion: 6 */
const fs = require('fs');
const request = require('sync-request');
const cheerio = require('cheerio');

const createWsdl = (serviceUrl, filename) => {
  console.log(serviceUrl);

  const MAX_RETRIES = 10;

  const getPage = (url) => {
    let trys = 0;

    do {
        try {
            return cheerio.load(request('GET', url).getBody().toString());
        } catch (err) {
            trys += 1;
            console.log(`[${trys}] Retrying ${url}`);
        }
    } while (trys < MAX_RETRIES);

    console.log(`To many retries for ${url}`);
    return null;
  };

  const getTypeEnumLinks = () => {
    const $ = getPage(`${serviceUrl}/types/index.html`);
    if (!$)  {
      return [];
    }
    return $('a.nohi').map((index, element) => {
      return $(element).attr('href');
    }).get().filter(href => href.search(/html$/) !== -1);
  };

  const parseEnumValues = ($) => {
    return $('.tableEnum>tr>td.tdEnum:first-child').map((index, element) => {
      return $(element).text().trim();
    }).get();
  };

  const processEnum = ($) => {
    const name = $('h1').text().trim();
    const values = parseEnumValues($).map(v => `<xs:enumeration value="${v}"/>`).join('');
    return `<xs:simpleType name="${name}"><xs:restriction base="xs:token">${values}</xs:restriction></xs:simpleType>`;
  };

  const parseName = (str) => str.substr(0, str.indexOf(' '));

  const parseType = (str) => {
    switch (str) 
    {
      case 'base64Binary':
      case 'boolean':
      case 'dateTime':
      case 'decimal':
      case 'double':
      case 'duration':
      case 'float':
      case 'int':
      case 'integer':
      case 'long':
      case 'string':
      case 'time':
      case 'token':
      case 'anyURI':
      case 'any':
        return `xs:${str}`;
      case 'datetime':
        return 'xs:dateTime';
      case 'number':
        return 'xs:double';
      default:
        return `ns:${str}`;
    }
  };

  const parseField = (index, element) => {
    const $ = cheerio(element);
    const text = $.text().trim();
    const name = parseName(text);
    const maxOccurs =  text.search('array of') !== -1 ? ' maxOccurs="unbounded"' : '';
    let type = $.find('i>a.nohi').text().trim();

    if (type === '') {
      type = $.find('i').text().trim();
      if (type === '') {
        throw new Error(`Unknown type for ${name}`);
      }
    }

    type = parseType(type);

    return `<xs:element name="${name}" type="${type}"${maxOccurs}/>`;
  };

  const parseFields = ($) => {
    return $('div.elementID').map(parseField).toArray();
  };

  const processType = ($) => {
    const name = $('h1').text().trim();
    const fields = parseFields($).join('');

    return `<xs:complexType name="${name}"><xs:sequence>${fields}</xs:sequence></xs:complexType>`;
  };

  const processTypeEnum = (url) => {
    const $ = getPage(`${serviceUrl}/types/${url}`);
    if (!$) {
      return [];
    }
    return url.search(/Enum.html$/) !== -1 ? processEnum($) : processType($); 
  };

  const types = getTypeEnumLinks().map(processTypeEnum);
  const extraTypes = fs.readFileSync(`wsdls/${filename}Types`, 'utf8');
  const operations = fs.readFileSync(`wsdls/${filename}Operations`, 'utf8');

  const xml = [
    '<?xml version="1.0" encoding="UTF-8"?>',
    '<wsdl:definitions',
    ' xmlns:xs="http://www.w3.org/2001/XMLSchema"',
    ' xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"',
    '>',
    '<wsdl:types><xs:schema>',
    types.join(''),
    extraTypes,
    '</xs:schema></wsdl:types>',
    operations,
    '</wsdl:definitions>'
  ].join('');

  fs.writeFile(`.tmp/downloads/${filename}.wsdl`, xml);
};

createWsdl(
  'https://developer.ebay.com/devzone/rest/api-ref/account',
  'Account'
);

createWsdl(
  'https://developer.ebay.com/devzone/rest/api-ref/inventory',
  'Inventory'
);

createWsdl(
  'https://developer.ebay.com/devzone/rest/api-ref/fulfillment',
  'Fulfillment'
);

createWsdl(
  'https://developer.ebay.com/devzone/rest/api-ref/marketing',
  'Marketing'
);

createWsdl(
  'https://developer.ebay.com/devzone/rest/api-ref/analytics',
  'Analytics'
);

createWsdl(
  'https://developer.ebay.com/devzone/rest/api-ref/metadata',
  'Metadata'
);

createWsdl(
  'https://developer.ebay.com/devzone/rest/api-ref/browse',
  'Browse'
);

createWsdl(
  'https://developer.ebay.com/devzone/rest/api-ref/order',
  'Order'
);

createWsdl(
  'https://developer.ebay.com/Devzone/post-order',
  'PostOrder'
);
