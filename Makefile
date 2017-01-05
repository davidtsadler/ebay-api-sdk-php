NODE-BIN	= ./node_modules/.bin
TMP		= ./.tmp
DIST		= ./dist
TEST		= ./test
DOWNLOADS	= $(TMP)/downloads
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

wsdls:
	@node $(SCRIPTS)/create_rest_wsdls.js

download:
	@wget -q -i services -P $(DOWNLOADS)
	@sed -i -e "s/<tns:version>.*<\/tns:version>//" $(DOWNLOADS)/ProductService.wsdl
	@sed -i -e "s/<version>.*<\/version>/<ver\/>/" $(DOWNLOADS)/ProductMetadataService.wsdl
	@sed -i -e "s/\t\t\t\t<Version>.*<\/Version>/\t\t\t\t<ver\/>/" $(DOWNLOADS)/ProductMetadataService.wsdl
	@echo "BulkDataExchange           : `sed -rn 's/.*<version>(.*)<\/version>/\1/p' $(DOWNLOADS)/BulkDataExchangeService.wsdl`"
	@echo "BusinessPoliciesManagement : `sed -rn 's/.*<version>(.*)<\/version>/\1/p' $(DOWNLOADS)/SellerProfilesManagementService.wsdl`"
	@echo "FileTransfer               : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/FileTransferService.wsdl`"
	@echo "Finding                    : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/FindingService.wsdl`"
	@echo "HalfFinding                : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/HalfFindingService.wsdl`"
	@echo "Merchandising              : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/MerchandisingService.wsdl`"
	@echo "MerchantData               : `sed -rn 's/<!-- Version ([[:digit:]]{3}).*/\1/p' $(DOWNLOADS)/merchantdataservice.xsd`"
	@echo "Product                    : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/ProductService.wsdl`"
	@echo "ProductMetadata            : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/ProductMetadataService.wsdl`"
	@echo "Resolution Case Management : `sed -rn 's/.*<version>(.*)<\/version>/\1/p' $(DOWNLOADS)/ResolutionCaseManagementService.wsdl`"
	@echo "Return Management          : `sed -rn 's/.*<version>(.*)<\/version>/\1/p' $(DOWNLOADS)/ReturnManagementService.wsdl`"
	@echo "Shopping                   : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/ShoppingService.wsdl`"
	@echo "Trading                    : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/ebaySvc.wsdl`"

patch:
	@sed -i -e 's/<xs:element name="aspects" type="xs:string" maxOccurs="unbounded"\/>/<xs:element name="aspects" type="xs:any"\/>/g' $(DOWNLOADS)/Inventory.wsdl
	
transform:
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/Account.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Account							\
		destDirectory=$(TRANSFORMED)/Account/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/Analytics.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Analytics						\
		destDirectory=$(TRANSFORMED)/Analytics/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/BulkDataExchangeService.wsdl			\
		-xsl:$(XSL)/sdk.xsl						\
		service=BulkDataExchange					\
		destDirectory=$(TRANSFORMED)/BulkDataExchange/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/Browse.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Browse    						\
		destDirectory=$(TRANSFORMED)/Browse/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/SellerProfilesManagementService.wsdl		\
		-xsl:$(XSL)/sdk.xsl						\
		service=BusinessPoliciesManagement				\
		destDirectory=$(TRANSFORMED)/BusinessPoliciesManagement/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/FileTransferService.wsdl			\
		-xsl:$(XSL)/sdk.xsl						\
		service=FileTransfer						\
		destDirectory=$(TRANSFORMED)/FileTransfer/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/FindingService.wsdl				\
		-xsl:$(XSL)/sdk.xsl	 					\
		service=Finding							\
		destDirectory=$(TRANSFORMED)/Finding/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/Fulfillment.wsdl				\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Fulfillment    						\
		destDirectory=$(TRANSFORMED)/Fulfillment/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/HalfFindingService.wsdl				\
		-xsl:$(XSL)/sdk.xsl						\
		service=HalfFinding						\
		destDirectory=$(TRANSFORMED)/HalfFinding/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/Inventory.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Inventory    						\
		destDirectory=$(TRANSFORMED)/Inventory/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/Marketing.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Marketing    						\
		destDirectory=$(TRANSFORMED)/Marketing/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/MerchandisingService.wsdl			\
		-xsl:$(XSL)/sdk.xsl						\
		service=Merchandising    					\
		destDirectory=$(TRANSFORMED)/Merchandising/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/merchantdataservice.xsd				\
		-xsl:$(XSL)/sdk.xsl						\
		service=MerchantData						\
		destDirectory=$(TRANSFORMED)/MerchantData/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/Metadata.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Metadata						\
		destDirectory=$(TRANSFORMED)/Metadata/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/Order.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=Order    						\
		destDirectory=$(TRANSFORMED)/Order/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/PostOrder.wsdl					\
		-xsl:$(XSL)/restSdk.xsl						\
		service=PostOrder    						\
		destDirectory=$(TRANSFORMED)/PostOrder/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/ProductService.wsdl				\
		-xsl:$(XSL)/sdk.xsl						\
		service=Product    						\
		destDirectory=$(TRANSFORMED)/Product/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/ProductMetadataService.wsdl			\
		-xsl:$(XSL)/sdk.xsl						\
		service=ProductMetadata    					\
		destDirectory=$(TRANSFORMED)/ProductMetadata/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/ResolutionCaseManagementService.wsdl		\
		-xsl:$(XSL)/sdk.xsl						\
		service=ResolutionCaseManagement				\
		destDirectory=$(TRANSFORMED)/ResolutionCaseManagement/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/ReturnManagementService.wsdl			\
		-xsl:$(XSL)/sdk.xsl						\
		service=ReturnManagement					\
		destDirectory=$(TRANSFORMED)/ReturnManagement/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/ShoppingService.wsdl				\
		-xsl:$(XSL)/sdk.xsl						\
		service=Shopping						\
		destDirectory=$(TRANSFORMED)/Shopping/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/ebaySvc.wsdl					\
		-xsl:$(XSL)/sdk.xsl						\
		service=Trading							\
		destDirectory=$(TRANSFORMED)/Trading/

build:	clean		\
	download	\
	wsdls		\
	patch		\
	transform
	@cp -r $(TRANSFORMED) $(DIST)

.PHONY: test wsdls
