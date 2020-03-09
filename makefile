# Example settings
LAMBDA_NAME=HelloWorldLambda
EXECUTABLE=$(LAMBDA_NAME)
LAMBDA_ZIP=lambda.zip

SWIFT_VERSION=5.1.4
SWIFT_DOCKER_IMAGE=fabianfett/amazonlinux-swift:${SWIFT_VERSION}-amazonlinux2-dev

clean_lambda:
	rm bootstrap || true
	rm lambda.zip || true

build_lambda:
	docker run \
			--rm \
			--volume "$(shell pwd):/src" \
			--workdir "/src" \
			$(SWIFT_DOCKER_IMAGE) \
			swift build -c release

package_lambda: build_lambda
	cp .build/release/$(EXECUTABLE) ./bootstrap
	zip -r -j $(LAMBDA_ZIP) ./bootstrap

