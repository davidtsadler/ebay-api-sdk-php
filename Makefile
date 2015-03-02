NODE-BIN	= node_modules/.bin
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
	@wget -q -i services -P .tmp/downloads

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
		-s:$(DOWNLOADS)/merchantdataservice.xsd				\
		-xsl:$(XSL)/sdk.xsl						\
		service=MerchantData						\
		destDirectory=$(TRANSFORMED)/MerchantData/
	@saxonb-xslt								\
		-ext:on								\
		-s:$(DOWNLOADS)/ShoppingService.wsdl				\
		-xsl:$(XSL)/sdk.xsl						\
		service=Shopping						\
		destDirectory=$(TRANSFORMED)/Shoppping/
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
