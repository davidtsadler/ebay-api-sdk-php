NODE-BIN	= ./node_modules/.bin
TMP		= ./.tmp
DIST		= ./dist
TEST		= ./test
WSDLS	= ./wsdls
TRANSFORMED	= $(TMP)/transformed
XSL		= ./xsl
SCRIPTS		= ./scripts

all:	test

clean:
	@rm -rf $(DIST)
	@rm -rf $(TMP)

lint:
	@$(NODE-BIN)/jshint $(TEST)/*.js $(SCRIPTS)/*.js

test:	lint clean
	@saxonb-xslt								\
		-ext:on								\
		-s:$(TEST)/fixtures/downloads/FindingAPI/api.xml		\
		-xsl:$(XSL)/sdk.xsl						\
		service=FindingAPI						\
		destDirectory=$(TRANSFORMED)/FindingAPI/
	@saxonb-xslt -ext:on							\
		-s:$(TEST)/fixtures/downloads/MerchantAPI/api.xml		\
		-xsl:$(XSL)/sdk.xsl						\
		service=MerchantAPI						\
		destDirectory=$(TRANSFORMED)/MerchantAPI/
	@saxonb-xslt -ext:on							\
		-s:$(TEST)/fixtures/downloads/RestAPI/api.xml			\
		-xsl:$(XSL)/restSdk.xsl						\
		service=RestAPI							\
		destDirectory=$(TRANSFORMED)/RestAPI/
	@$(NODE-BIN)/nodeunit $(TEST)/*_test.js

create_wsdls:
	@node $(SCRIPTS)/create_rest_wsdls.js

download_wsdls:
	@cd $(WSDLS) && cat ../services | xargs -n 1 curl -sO
	@sed -i -e "s/<tns:version>.*<\/tns:version>//" $(WSDLS)/ProductService.wsdl
	@sed -i -e "s/<version>.*<\/version>/<ver\/>/" $(WSDLS)/ProductMetadataService.wsdl
	@sed -i -e "s/\t\t\t\t<Version>.*<\/Version>/\t\t\t\t<ver\/>/" $(WSDLS)/ProductMetadataService.wsdl
	@sed -i -e "s/<xs:element name=\"getCompatibilitySearchNamesResponse\" type=\"tns:GetProductSearchNamesResponse\"\/>/<xs:element name=\"getCompatibilitySearchNamesResponse\" type=\"tns:GetCompatibilitySearchNamesResponse\"\/>/" $(WSDLS)/ProductMetadataService.wsdl
	@sed -i -e "s/<xs:element name=\"getCompatibilitySearchValuesRequest\" type=\"tns:GetProductSearchValuesRequest\"\/>/<xs:element name=\"getCompatibilitySearchValuesRequest\" type=\"tns:GetCompatibilitySearchValuesRequest\"\/>/" $(WSDLS)/ProductMetadataService.wsdl
	@sed -i -e "s/<xs:element name=\"getCompatibilitySearchValuesResponse\" type=\"tns:GetProductSearchValuesResponse\"\/>/<xs:element name=\"getCompatibilitySearchValuesResponse\" type=\"tns:GetCompatibilitySearchValuesResponse\"\/>/" $(WSDLS)/ProductMetadataService.wsdl
	@sed -i -e "s/<xs:element name=\"getCompatibilitySearchValuesBulkRequest\" type=\"tns:GetProductSearchValuesBulkRequest\"\/>/<xs:element name=\"getCompatibilitySearchValuesBulkRequest\" type=\"tns:GetCompatibilitySearchValuesBulkRequest\"\/>/" $(WSDLS)/ProductMetadataService.wsdl
	@sed -i -e "s/<xs:element name=\"getCompatibilitySearchDataVersionRequest\" type=\"tns:GetProductSearchDataVersionRequest\"\/>/<xs:element name=\"getCompatibilitySearchDataVersionRequest\" type=\"tns:GetCompatibilitySearchDataVersionRequest\"\/>/" $(WSDLS)/ProductMetadataService.wsdl
	@sed -i -e "s/<xs:element name=\"getCompatibilitySearchDataVersionResponse\" type=\"tns:GetProductSearchDataVersionResponse\"\/>/<xs:element name=\"getCompatibilitySearchDataVersionResponse\" type=\"tns:GetCompatibilitySearchDataVersionResponse\"\/>/" $(WSDLS)/ProductMetadataService.wsdl
	@sed -i -e "5036,5051 s/.*//" $(WSDLS)/ResolutionCaseManagementService.wsdl
	@sed -i -e "5067,5083 s/.*//" $(WSDLS)/ResolutionCaseManagementService.wsdl
	@sed -i -e "s/<\/xs:schema>/<xs:complexType name=\"appealRef\"><xs:attribute name=\"idref\" type=\"xs:string\"\/><\/xs:complexType><xs:complexType name=\"moneyMovementRef\"><xs:attribute name=\"idref\" type=\"xs:string\"\/><\/xs:complexType><\/xs:schema>/" $(WSDLS)/ResolutionCaseManagementService.wsdl
	@echo "BulkDataExchange           : `sed -rn 's/.*<version>(.*)<\/version>/\1/p' $(WSDLS)/BulkDataExchangeService.wsdl`"
	@echo "BusinessPoliciesManagement : `sed -rn 's/.*<version>(.*)<\/version>/\1/p' $(WSDLS)/SellerProfilesManagementService.wsdl`"
	@echo "Feedback                   : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(WSDLS)/FeedbackService.wsdl`"
	@echo "FileTransfer               : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(WSDLS)/FileTransferService.wsdl`"
	@echo "Finding                    : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(WSDLS)/FindingService.wsdl`"
	@echo "HalfFinding                : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(WSDLS)/HalfFindingService.wsdl`"
	@echo "Merchandising              : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(WSDLS)/MerchandisingService.wsdl`"
	@echo "MerchantData               : `sed -rn 's/<!-- Version ([[:digit:]]{3}).*/\1/p' $(WSDLS)/merchantdataservice.xsd`"
	@echo "Product                    : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(WSDLS)/ProductService.wsdl`"
	@echo "ProductMetadata            : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(WSDLS)/ProductMetadataService.wsdl`"
	@echo "Related Items Management   : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(WSDLS)/BundleManagementService.wsdl`"
	@echo "Resolution Case Management : `sed -rn 's/.*<version>(.*)<\/version>/\1/p' $(WSDLS)/ResolutionCaseManagementService.wsdl`"
	@echo "Return Management          : `sed -rn 's/.*<version>(.*)<\/version>/\1/p' $(WSDLS)/ReturnManagementService.wsdl`"
	@echo "Shopping                   : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(WSDLS)/ShoppingService.wsdl`"
	@echo "Trading                    : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(WSDLS)/ebaySvc.wsdl`"

patch_wsdls:
	@sed -i -e 's/<xs:element name="aspects" type="xs:string" maxOccurs="unbounded"\/>/<xs:element name="aspects" type="xs:any"\/>/g' $(WSDLS)/Inventory.wsdl
	@sed -i -e 's/standardslevel/standardsLevel/g' $(WSDLS)/Analytics.wsdl

transform:
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/Account.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Account							\
		destDirectory=$(TRANSFORMED)/Account/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/Analytics.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Analytics						\
		destDirectory=$(TRANSFORMED)/Analytics/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/BulkDataExchangeService.wsdl			\
		-xsl:$(XSL)/sdk.xsl						\
		service=BulkDataExchange					\
		destDirectory=$(TRANSFORMED)/BulkDataExchange/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/Browse.wsdl						\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Browse    						\
		destDirectory=$(TRANSFORMED)/Browse/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/Catalog.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Catalog							\
		destDirectory=$(TRANSFORMED)/Catalog/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/SellerProfilesManagementService.wsdl		\
		-xsl:$(XSL)/sdk.xsl						\
		service=BusinessPoliciesManagement				\
		destDirectory=$(TRANSFORMED)/BusinessPoliciesManagement/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/Feed.wsdl						\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Feed    						\
		destDirectory=$(TRANSFORMED)/Feed/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/FeedbackService.wsdl				\
		-xsl:$(XSL)/sdk.xsl	 					\
		service=Feedback						\
		destDirectory=$(TRANSFORMED)/Feedback/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/FileTransferService.wsdl				\
		-xsl:$(XSL)/sdk.xsl						\
		service=FileTransfer						\
		destDirectory=$(TRANSFORMED)/FileTransfer/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/FindingService.wsdl					\
		-xsl:$(XSL)/sdk.xsl	 					\
		service=Finding							\
		destDirectory=$(TRANSFORMED)/Finding/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/Fulfillment.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Fulfillment    						\
		destDirectory=$(TRANSFORMED)/Fulfillment/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/HalfFindingService.wsdl				\
		-xsl:$(XSL)/sdk.xsl						\
		service=HalfFinding						\
		destDirectory=$(TRANSFORMED)/HalfFinding/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/Inventory.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Inventory    						\
		destDirectory=$(TRANSFORMED)/Inventory/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/Marketing.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Marketing    						\
		destDirectory=$(TRANSFORMED)/Marketing/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/MerchandisingService.wsdl				\
		-xsl:$(XSL)/sdk.xsl						\
		service=Merchandising    					\
		destDirectory=$(TRANSFORMED)/Merchandising/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/merchantdataservice.xsd				\
		-xsl:$(XSL)/sdk.xsl						\
		service=MerchantData						\
		destDirectory=$(TRANSFORMED)/MerchantData/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/Metadata.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Metadata						\
		destDirectory=$(TRANSFORMED)/Metadata/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/Order.wsdl						\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Order    						\
		destDirectory=$(TRANSFORMED)/Order/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/Taxonomy.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Taxonomy    						\
		destDirectory=$(TRANSFORMED)/Taxonomy/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/PostOrder.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=PostOrder    						\
		destDirectory=$(TRANSFORMED)/PostOrder/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/ProductService.wsdl					\
		-xsl:$(XSL)/sdk.xsl						\
		service=Product    						\
		destDirectory=$(TRANSFORMED)/Product/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/ProductMetadataService.wsdl				\
		-xsl:$(XSL)/sdk.xsl						\
		service=ProductMetadata    					\
		destDirectory=$(TRANSFORMED)/ProductMetadata/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/BundleManagementService.wsdl			\
		-xsl:$(XSL)/sdk.xsl						\
		service=RelatedItemsManagement					\
		destDirectory=$(TRANSFORMED)/RelatedItemsManagement/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/ResolutionCaseManagementService.wsdl		\
		-xsl:$(XSL)/sdk.xsl						\
		service=ResolutionCaseManagement				\
		destDirectory=$(TRANSFORMED)/ResolutionCaseManagement/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/ReturnManagementService.wsdl			\
		-xsl:$(XSL)/sdk.xsl						\
		service=ReturnManagement					\
		destDirectory=$(TRANSFORMED)/ReturnManagement/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/ShoppingService.wsdl				\
		-xsl:$(XSL)/sdk.xsl						\
		service=Shopping						\
		destDirectory=$(TRANSFORMED)/Shopping/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(WSDLS)/ebaySvc.wsdl					\
		-xsl:$(XSL)/sdk.xsl						\
		service=Trading							\
		destDirectory=$(TRANSFORMED)/Trading/
	@cp $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetProductSearchNamesResponse.php $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetCompatibilitySearchNamesResponse.php
	@sed -i -e "s/ProductSearchNamesResponse/CompatibilitySearchNamesResponse/" $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetCompatibilitySearchNamesResponse.php
	@cp $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetProductSearchNamesResponseTest.php $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetCompatibilitySearchNamesResponseTest.php
	@sed -i -e "s/ProductSearchNamesResponse/CompatibilitySearchNamesResponse/" $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetCompatibilitySearchNamesResponseTest.php
	@cp $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetProductSearchValuesRequest.php $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetCompatibilitySearchValuesRequest.php
	@sed -i -e "s/ProductSearchValuesRequest/CompatibilitySearchValuesRequest/" $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetCompatibilitySearchValuesRequest.php
	@cp $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetProductSearchValuesRequestTest.php $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetCompatibilitySearchValuesRequestTest.php
	@sed -i -e "s/ProductSearchValuesRequest/CompatibilitySearchValuesRequest/" $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetCompatibilitySearchValuesRequestTest.php
	@cp $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetProductSearchValuesResponse.php $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetCompatibilitySearchValuesResponse.php
	@sed -i -e "s/ProductSearchValuesResponse/CompatibilitySearchValuesResponse/" $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetCompatibilitySearchValuesResponse.php
	@cp $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetProductSearchValuesResponseTest.php $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetCompatibilitySearchValuesResponseTest.php
	@sed -i -e "s/ProductSearchValuesResponse/CompatibilitySearchValuesResponse/" $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetCompatibilitySearchValuesResponseTest.php
	@cp $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetProductSearchValuesBulkRequest.php $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetCompatibilitySearchValuesBulkRequest.php
	@sed -i -e "s/ProductSearchValuesBulkRequest/CompatibilitySearchValuesBulkRequest/" $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetCompatibilitySearchValuesBulkRequest.php
	@cp $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetProductSearchValuesBulkRequestTest.php $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetCompatibilitySearchValuesBulkRequestTest.php
	@sed -i -e "s/ProductSearchValuesBulkRequest/CompatibilitySearchValuesBulkRequest/" $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetCompatibilitySearchValuesBulkRequestTest.php
	@cp $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetProductSearchDataVersionRequest.php $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetCompatibilitySearchDataVersionRequest.php
	@sed -i -e "s/ProductSearchDataVersionRequest/CompatibilitySearchDataVersionRequest/" $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetCompatibilitySearchDataVersionRequest.php
	@cp $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetProductSearchDataVersionRequestTest.php $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetCompatibilitySearchDataVersionRequestTest.php
	@sed -i -e "s/ProductSearchDataVersionRequest/CompatibilitySearchDataVersionRequest/" $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetCompatibilitySearchDataVersionRequestTest.php
	@cp $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetProductSearchDataVersionResponse.php $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetCompatibilitySearchDataVersionResponse.php
	@sed -i -e "s/ProductSearchDataVersionResponse/CompatibilitySearchDataVersionResponse/" $(TRANSFORMED)/ProductMetadata/src/ProductMetadata/Types/GetCompatibilitySearchDataVersionResponse.php
	@cp $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetProductSearchDataVersionResponseTest.php $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetCompatibilitySearchDataVersionResponseTest.php
	@sed -i -e "s/ProductSearchDataVersionResponse/CompatibilitySearchDataVersionResponse/" $(TRANSFORMED)/ProductMetadata/test/ProductMetadata/Types/GetCompatibilitySearchDataVersionResponseTest.php

wsdls:	clean		\
	download_wsdls	\
	create_wsdls	\
	patch_wsdls
	@find $(WSDLS) -type f -exec xmllint --format {} --output {} \;

build:	clean		\
	transform
	@cp -r $(TRANSFORMED) $(DIST)

.PHONY: test wsdls
