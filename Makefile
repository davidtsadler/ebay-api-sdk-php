.PHONY: test

NODE-BIN	= node_modules/.bin
TMP		= ./.tmp
DIST		= ./dist
TEST		= ./test

all:	test

clean:
	@rm -rf $(DIST)
	@rm -rf $(TMP)

lint:
	@$(NODE-BIN)/jshint $(TEST)/*.js

test:	lint clean
	@saxonb-xslt \
		-ext:on \
		-s:$(TEST)/fixtures/downloads/FindingAPI/1/api.xml \
		-xsl:./xsl/sdk.xsl \
		service=FindingAPI \
		destDirectory=$(TMP)/transformed/FindingAPI/1
	@saxonb-xslt -ext:on \
		-s:$(TEST)/fixtures/downloads/MerchantAPI/1/api.xml \
		-xsl:./xsl/sdk.xsl \
		service=MerchantAPI \
		destDirectory=$(TMP)/transformed/MerchantAPI/1
	@$(NODE-BIN)/nodeunit $(TEST)/*_test.js
