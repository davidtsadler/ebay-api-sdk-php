NODE-BIN	= ./node_modules/.bin
TMP		= ./.tmp
DIST		= ./dist
TEST		= ./test
DOWNLOADS	= $(TMP)/downloads
TRANSFORMED	= $(TMP)/transformed
XSL		= ./xsl

all:	test

clean:
	@rm -rf $(DIST)
	@rm -rf $(TMP)

lint:
	@$(NODE-BIN)/jshint $(TEST)/*.js

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
	@$(NODE-BIN)/nodeunit $(TEST)/*_test.js

download:
	@wget -q -i services -P $(DOWNLOADS)
	sed -i -e "s/<version>.*<\/version>/<ver\/>/" $(DOWNLOADS)/ProductMetadataService.wsdl
	sed -i -e "s/\t\t\t\t<Version>.*<\/Version>/\t\t\t\t<ver\/>/" $(DOWNLOADS)/ProductMetadataService.wsdl
	@echo "BulkDataExchange           : `sed -rn 's/.*<version>(.*)<\/version>/\1/p' $(DOWNLOADS)/BulkDataExchangeService.wsdl`"
	@echo "BusinessPoliciesManagement : `sed -rn 's/.*<version>(.*)<\/version>/\1/p' $(DOWNLOADS)/SellerProfilesManagementService.wsdl`"
	@echo "FileTransfer               : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/FileTransferService.wsdl`"
	@echo "Finding                    : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/FindingService.wsdl`"
	@echo "HalfFinding                : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/HalfFindingService.wsdl`"
	@echo "Merchandising             : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/MerchandisingService.wsdl`"
	@echo "MerchantData               : `sed -rn 's/<!-- Version ([[:digit:]]{3}).*/\1/p' $(DOWNLOADS)/merchantdataservice.xsd`"
	@echo "Product                    : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/ProductService.wsdl`"
	@echo "ProductMetadata            : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/ProductMetadataService.wsdl`"
	@echo "Resolution Case Management : `sed -rn 's/.*<version>(.*)<\/version>/\1/p' $(DOWNLOADS)/ResolutionCaseManagementService.wsdl`"
	@echo "Return Management          : `sed -rn 's/.*<version>(.*)<\/version>/\1/p' $(DOWNLOADS)/ReturnManagementService.wsdl`"
	@echo "Shopping                   : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/ShoppingService.wsdl`"
	@echo "Trading                    : `sed -rn 's/.*<Version>(.*)<\/Version>/\1/p' $(DOWNLOADS)/ebaySvc.wsdl`"

transform:
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/BulkDataExchangeService.wsdl			\
		-xsl:$(XSL)/sdk.xsl						\
		service=BulkDataExchange					\
		destDirectory=$(TRANSFORMED)/BulkDataExchange/
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
		-s:$(DOWNLOADS)/HalfFindingService.wsdl				\
		-xsl:$(XSL)/sdk.xsl						\
		service=HalfFinding						\
		destDirectory=$(TRANSFORMED)/HalfFinding/
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
	transform
	@cp -r $(TRANSFORMED) $(DIST)

.PHONY: test
