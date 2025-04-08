# Changelog

## 0.1.0-alpha.6 (2025-04-08)

Full Changelog: [v0.1.0-alpha.5...v0.1.0-alpha.6](https://github.com/Increase/increase-ruby/compare/v0.1.0-alpha.5...v0.1.0-alpha.6)

### Features

* **api:** api update ([#42](https://github.com/Increase/increase-ruby/issues/42)) ([20108ce](https://github.com/Increase/increase-ruby/commit/20108ce07794eaec00dd89e66c5bea8a16c91f2f))
* use Pathname alongside raw IO handles for file uploads ([#41](https://github.com/Increase/increase-ruby/issues/41)) ([b7e2430](https://github.com/Increase/increase-ruby/commit/b7e2430aab96fb90550164b521aec7108282d35f))


### Chores

* add README docs for using solargraph when installing gem from git ([#40](https://github.com/Increase/increase-ruby/issues/40)) ([d68da15](https://github.com/Increase/increase-ruby/commit/d68da15415f8a0e76cb0f6befcb8c18b358f11c4))
* always fold up method bodies in sorbet type definitions ([#34](https://github.com/Increase/increase-ruby/issues/34)) ([1d073b1](https://github.com/Increase/increase-ruby/commit/1d073b100ba23d28304bfa5fbcb6b021dccbeaf9))
* easier to read examples in README.md ([#37](https://github.com/Increase/increase-ruby/issues/37)) ([b7e210a](https://github.com/Increase/increase-ruby/commit/b7e210a2b4abc745579b9f688b7c207a6ad9a25f))
* **internal:** misc small improvements ([#31](https://github.com/Increase/increase-ruby/issues/31)) ([51871b0](https://github.com/Increase/increase-ruby/commit/51871b0593ca9ba889978c1cbbf06410fca2251b))
* **internal:** more concise handling of parameter naming conflicts ([#36](https://github.com/Increase/increase-ruby/issues/36)) ([1eb565b](https://github.com/Increase/increase-ruby/commit/1eb565bab5b01fb9a4f306b697e6b8148b444dbb))
* **internal:** rubocop rules ([#33](https://github.com/Increase/increase-ruby/issues/33)) ([fdf49af](https://github.com/Increase/increase-ruby/commit/fdf49aff062233facde7a19e85e988d097c83d9f))
* **internal:** run rubocop linter in parallel ([#32](https://github.com/Increase/increase-ruby/issues/32)) ([f28a7d0](https://github.com/Increase/increase-ruby/commit/f28a7d0c3cff243b6bb81a4383883326384b2bf3))
* **internal:** version bump ([#29](https://github.com/Increase/increase-ruby/issues/29)) ([131900e](https://github.com/Increase/increase-ruby/commit/131900e26a21f7d708358735f239b50011f0abaa))
* make client tests look prettier ([#39](https://github.com/Increase/increase-ruby/issues/39)) ([39145e0](https://github.com/Increase/increase-ruby/commit/39145e0032a6b3a316b522fa4458d7ceebd78384))
* **tests:** improve enum examples ([#38](https://github.com/Increase/increase-ruby/issues/38)) ([0d69f9f](https://github.com/Increase/increase-ruby/commit/0d69f9f79636c51dd8445b5b9d91d486d7051569))
* update yard comment formatting ([#35](https://github.com/Increase/increase-ruby/issues/35)) ([dc047f3](https://github.com/Increase/increase-ruby/commit/dc047f399cc11b6d58f295f5c8a8856ca3c30acb))

## 0.1.0-alpha.5 (2025-04-05)

Full Changelog: [v0.1.0-alpha.4...v0.1.0-alpha.5](https://github.com/Increase/increase-ruby/compare/v0.1.0-alpha.4...v0.1.0-alpha.5)

### Features

* allow all valid `JSON` types to be encoded ([#26](https://github.com/Increase/increase-ruby/issues/26)) ([92760b3](https://github.com/Increase/increase-ruby/commit/92760b3aba92abca8c6b4d6550d75b94c1a8fbc2))
* support query, header, and body params that have identical names ([#25](https://github.com/Increase/increase-ruby/issues/25)) ([def73dd](https://github.com/Increase/increase-ruby/commit/def73dd349fa2aec3074e16bdfa2a165bf4fc1e1))


### Bug Fixes

* converter should transform stringio into string where applicable ([#28](https://github.com/Increase/increase-ruby/issues/28)) ([68e4e9d](https://github.com/Increase/increase-ruby/commit/68e4e9df4a5938442eb890da6f1918f04d34e333))


### Chores

* document LSP support in read me ([#24](https://github.com/Increase/increase-ruby/issues/24)) ([778538d](https://github.com/Increase/increase-ruby/commit/778538da18c49156d45c68c9370c3628fd7e594a))
* **internal:** version bump ([#19](https://github.com/Increase/increase-ruby/issues/19)) ([fd9e8ad](https://github.com/Increase/increase-ruby/commit/fd9e8ada315a49377dbb2aa8ec6af48a180fb651))
* misc sdk polish ([#23](https://github.com/Increase/increase-ruby/issues/23)) ([e056d8a](https://github.com/Increase/increase-ruby/commit/e056d8a96d3da4568daf30d68f980a81c69ab5dc))
* rename confusing `Type::BooleanModel` to `Type::Boolean` ([#27](https://github.com/Increase/increase-ruby/issues/27)) ([ae0a5ee](https://github.com/Increase/increase-ruby/commit/ae0a5ee0e1c0177ab6aa08032f29655b5412b37d))
* simplify internal utils ([#22](https://github.com/Increase/increase-ruby/issues/22)) ([da6ec29](https://github.com/Increase/increase-ruby/commit/da6ec29d5dd5ad6bfea0f3461221f3a80259738d))

## 0.1.0-alpha.4 (2025-04-04)

Full Changelog: [v0.1.0-alpha.3...v0.1.0-alpha.4](https://github.com/Increase/increase-ruby/compare/v0.1.0-alpha.3...v0.1.0-alpha.4)

### Features

* **api:** api update ([#17](https://github.com/Increase/increase-ruby/issues/17)) ([a3f4158](https://github.com/Increase/increase-ruby/commit/a3f415870ca066d5a5554351d4aebffdefe6535e))
* support solargraph generics ([#15](https://github.com/Increase/increase-ruby/issues/15)) ([8555967](https://github.com/Increase/increase-ruby/commit/8555967605a0c2fdc50660beb8e6bea1d3434cf8))


### Chores

* do not use literals for version in type definitions ([#18](https://github.com/Increase/increase-ruby/issues/18)) ([d88128c](https://github.com/Increase/increase-ruby/commit/d88128c03e8171ba2803eeb53548ddd5db4ecc0d))
* **internal:** version bump ([#13](https://github.com/Increase/increase-ruby/issues/13)) ([2a3a20f](https://github.com/Increase/increase-ruby/commit/2a3a20f1966c32215616997de572c2e3ef9c743d))

## 0.1.0-alpha.3 (2025-04-03)

Full Changelog: [v0.1.0-alpha.2...v0.1.0-alpha.3](https://github.com/Increase/increase-ruby/compare/v0.1.0-alpha.2...v0.1.0-alpha.3)

### ⚠ BREAKING CHANGES

* bump min supported ruby version to 3.1 (oldest non-EOL) ([#10](https://github.com/Increase/increase-ruby/issues/10))
* remove top level type aliases to relocated classes ([#9](https://github.com/Increase/increase-ruby/issues/9))

### Features

* bump min supported ruby version to 3.1 (oldest non-EOL) ([#10](https://github.com/Increase/increase-ruby/issues/10)) ([6bdbf40](https://github.com/Increase/increase-ruby/commit/6bdbf40be7f88549fdac9c50958a876b8bc21319))
* remove top level type aliases to relocated classes ([#9](https://github.com/Increase/increase-ruby/issues/9)) ([21e1d7f](https://github.com/Increase/increase-ruby/commit/21e1d7f50eeca18069b3f32cb7f1872dfc3ca8f6))


### Bug Fixes

* pre-release version string should match ruby, not semver conventions ([#12](https://github.com/Increase/increase-ruby/issues/12)) ([fda09d8](https://github.com/Increase/increase-ruby/commit/fda09d8fb2b491f9b893c340ea20d2f1d3f3e21c))


### Chores

* demonstrate how to make undocumented requests in README ([#11](https://github.com/Increase/increase-ruby/issues/11)) ([3a4e543](https://github.com/Increase/increase-ruby/commit/3a4e543eeb9b6b72559e4c7193a54f27fe006f49))
* **internal:** version bump ([#6](https://github.com/Increase/increase-ruby/issues/6)) ([99ee517](https://github.com/Increase/increase-ruby/commit/99ee5170448bca36d7773f7a443c27a4028da439))
* move private classes into internal module ([#8](https://github.com/Increase/increase-ruby/issues/8)) ([13f35d4](https://github.com/Increase/increase-ruby/commit/13f35d46ee4677f7f034afd91c6a911ec71e1ae7))

## 0.1.0-alpha.2 (2025-04-02)

Full Changelog: [v0.1.0-alpha.1...v0.1.0-alpha.2](https://github.com/Increase/increase-ruby/compare/v0.1.0-alpha.1...v0.1.0-alpha.2)

### Features

* **api:** api update ([#5](https://github.com/Increase/increase-ruby/issues/5)) ([33688e6](https://github.com/Increase/increase-ruby/commit/33688e6f59773d138b6f33c50d8ed9316e7cbf37))


### Chores

* update SDK settings ([#3](https://github.com/Increase/increase-ruby/issues/3)) ([b179c38](https://github.com/Increase/increase-ruby/commit/b179c383e7f1f750111cc2f393f55d1b81751a8c))

## 0.1.0-alpha.1 (2025-04-02)

Full Changelog: [v0.0.1-alpha.0...v0.1.0-alpha.1](https://github.com/Increase/increase-ruby/compare/v0.0.1-alpha.0...v0.1.0-alpha.1)

### ⚠ BREAKING CHANGES

* use tagged enums in sorbet type definitions
* support `for item in stream` style iteration on `Stream`s
* **model:** base model should recursively store coerced base models
* base page should be module instead of class
* breaking change - improved request options signatures
* (breaking change) introduce nesting for models under deeply nested resources

### Features

* ! (breaking change) pull path params not in the last position into the params argument ([147911a](https://github.com/Increase/increase-ruby/commit/147911a823c5496c1bd86c6b378c9f2f0430d6cd))
* (breaking change) introduce nesting for models under deeply nested resources ([60581c1](https://github.com/Increase/increase-ruby/commit/60581c147a220ab06991e371d9b81f360f531d32))
* add deprecation notice to enum members and resources ([ae2ffa2](https://github.com/Increase/increase-ruby/commit/ae2ffa298fa2c5fd4c29bf78d79e5ca8ca3ef02a))
* add jsonl support ([3098169](https://github.com/Increase/increase-ruby/commit/30981697b94652ef9e04019fce6cd476b9704c5a))
* add reference links in yard ([f8b665b](https://github.com/Increase/increase-ruby/commit/f8b665b46ad39a324a16d54771895cd8c0ea495a))
* add SKIP_BREW env var to ./scripts/bootstrap ([3e521af](https://github.com/Increase/increase-ruby/commit/3e521afb46da4f4110afb280f29cb99d35a817e6))
* **api:** api update ([52e8980](https://github.com/Increase/increase-ruby/commit/52e8980cf7c8c3c059ebfdec9fad9d88fb1faf39))
* **api:** api update ([ca571e0](https://github.com/Increase/increase-ruby/commit/ca571e03cc6587ba1697636f27645d7f814e2d8c))
* **api:** api update ([6cf4b04](https://github.com/Increase/increase-ruby/commit/6cf4b04189f40a2c352db84b2eee073dd79cf1e5))
* **api:** api update ([e4eaaa8](https://github.com/Increase/increase-ruby/commit/e4eaaa873a573e602482c8ce912bca4c363efb7b))
* **api:** api update ([6dc98cf](https://github.com/Increase/increase-ruby/commit/6dc98cf2b76744adbb2323f98106f4492af3a23b))
* **api:** api update ([cd7164e](https://github.com/Increase/increase-ruby/commit/cd7164e847e04ae7499e7fdb2408afb1e51c5b28))
* **api:** api update ([6643fa5](https://github.com/Increase/increase-ruby/commit/6643fa5bc1a842c35209a348807e6dbc0fc5ebc9))
* **api:** api update ([c4d5da8](https://github.com/Increase/increase-ruby/commit/c4d5da87aba222f5b6950bdb3770979171ec6edb))
* **api:** api update ([fc2106d](https://github.com/Increase/increase-ruby/commit/fc2106d0f62367183efcd374a19537bb5d74596b))
* **api:** api update ([39532f5](https://github.com/Increase/increase-ruby/commit/39532f5be617c22204ed4d279ceeb45982fd4caf))
* **api:** api update ([1d9d9f7](https://github.com/Increase/increase-ruby/commit/1d9d9f7e6c1a251d24275c1c454842974ee7587a))
* **api:** api update ([bc02929](https://github.com/Increase/increase-ruby/commit/bc02929ffa76f683ce3575bf93be54cbe088bd09))
* **api:** api update ([78d0c3f](https://github.com/Increase/increase-ruby/commit/78d0c3f9cb68edf1a23c9d9be3b223703f042a71))
* **api:** api update ([fbf8ba1](https://github.com/Increase/increase-ruby/commit/fbf8ba17b9341cefb3c10f017af098a37bfc865d))
* **api:** api update ([3b835d0](https://github.com/Increase/increase-ruby/commit/3b835d077374d5f5ede970a8bcb6bfa021e0e536))
* **api:** api update ([45be1dc](https://github.com/Increase/increase-ruby/commit/45be1dc43d5cd06da162aa3ec0c2924d1c135c23))
* **api:** api update ([2afb9cd](https://github.com/Increase/increase-ruby/commit/2afb9cd5b295ba072263fa5d5acb6f037b5f26a7))
* **api:** api update ([0789479](https://github.com/Increase/increase-ruby/commit/0789479a3e2a4b86866a18bc77aaa192557d64db))
* **api:** api update ([9a02113](https://github.com/Increase/increase-ruby/commit/9a02113e70d1310a572dae84dc8ed2815c12a09e))
* **api:** api update ([41c257e](https://github.com/Increase/increase-ruby/commit/41c257e1b684668d22368ef93aba4b81a5d9d561))
* **api:** api update ([dcad7e7](https://github.com/Increase/increase-ruby/commit/dcad7e7e1bf2f901f2924ed61c823ef4cd846692))
* **api:** api update ([550188f](https://github.com/Increase/increase-ruby/commit/550188f35545800fc03a14a95acc4b7d7235811f))
* **api:** api update ([040b9e1](https://github.com/Increase/increase-ruby/commit/040b9e1954224701e56deb117886e1543922c4b3))
* **api:** api update ([6794aa4](https://github.com/Increase/increase-ruby/commit/6794aa40605d82ec12e3f09766a75af26bea111f))
* **api:** api update ([26d41da](https://github.com/Increase/increase-ruby/commit/26d41da373586c957d8823707ad1376e80d975a7))
* **api:** api update ([bdafadd](https://github.com/Increase/increase-ruby/commit/bdafaddd97e2a1954b6786991b2d649b174abd7f))
* **api:** api update ([2fc3b37](https://github.com/Increase/increase-ruby/commit/2fc3b3721eb5fa9f75c8b7d14c88e5f8d2cbfce5))
* **api:** api update ([d51504b](https://github.com/Increase/increase-ruby/commit/d51504bc51b8582d132eb0a09399541b6f79cbe3))
* **api:** api update ([291a628](https://github.com/Increase/increase-ruby/commit/291a6280734f60770a8e6f1360848b52eda0b057))
* **api:** api update ([7e3325d](https://github.com/Increase/increase-ruby/commit/7e3325ddc08b4ccc49254e3eb6afa5c9c2a49cfc))
* **api:** api update ([4c298a9](https://github.com/Increase/increase-ruby/commit/4c298a931150599d57f3c5cf13d5356bffb36ac2))
* **api:** api update ([1a59501](https://github.com/Increase/increase-ruby/commit/1a595015f9edaffcb36dbd6a5defb3a1b97b71a3))
* **api:** api update ([a0d9cb9](https://github.com/Increase/increase-ruby/commit/a0d9cb9dc542ee2ed266fd109c8c97ed07ea1df7))
* **api:** api update ([a412b50](https://github.com/Increase/increase-ruby/commit/a412b50a1ad053ff642d1165fe0d6cda0ba087b0))
* **api:** api update ([fb6888c](https://github.com/Increase/increase-ruby/commit/fb6888cb62862d5c4fc2242e8b399fee700bdda1))
* **api:** api update ([a4e49d5](https://github.com/Increase/increase-ruby/commit/a4e49d50e481d9d853ac734c4e4e911a824a09fc))
* **api:** api update ([497745a](https://github.com/Increase/increase-ruby/commit/497745a8c2a0b8b63cd61ef03f7ae92de0456d39))
* **api:** api update ([2cd6df1](https://github.com/Increase/increase-ruby/commit/2cd6df1a999bf8aa87eb167036a73f9faf90b76e))
* **api:** api update ([783a5df](https://github.com/Increase/increase-ruby/commit/783a5df1b44a497ac6c228b9eeccfeecd43a201f))
* **api:** api update ([2ea5f50](https://github.com/Increase/increase-ruby/commit/2ea5f50317061ad1e14a47e21ea10fab70c97dd8))
* **api:** api update ([c3751e5](https://github.com/Increase/increase-ruby/commit/c3751e5f2651542f8ce6105fd0ea68616a978541))
* **api:** api update ([6c72e15](https://github.com/Increase/increase-ruby/commit/6c72e156479288fa54e5882b44b601e326bc6ea9))
* **api:** api update ([e43d1ac](https://github.com/Increase/increase-ruby/commit/e43d1ac6c5a39b960f0e979d5883e31ab5158e99))
* **api:** api update ([073b27f](https://github.com/Increase/increase-ruby/commit/073b27f6fac54dacee7028fee53684aba2264f34))
* **api:** api update ([3a5af19](https://github.com/Increase/increase-ruby/commit/3a5af199975c50969d4e3387a7ba2bb1a9f9695f))
* **api:** api update ([0ce9550](https://github.com/Increase/increase-ruby/commit/0ce955019f5cb4b2df8716c81a1afd4f9738a588))
* **api:** api update ([0a1800f](https://github.com/Increase/increase-ruby/commit/0a1800f137923b1222d52f61b360d5b3bda6f0d6))
* **api:** api update ([e481117](https://github.com/Increase/increase-ruby/commit/e4811171ce9fb3bdc59b139ac2a9dad936af343d))
* **api:** api update ([626091d](https://github.com/Increase/increase-ruby/commit/626091dca6618692fdbb65d682d17191699459ed))
* **api:** api update ([d67aecb](https://github.com/Increase/increase-ruby/commit/d67aecbbdcd8b6669b2f58245bdc89af86f0514a))
* **api:** api update ([c722fdf](https://github.com/Increase/increase-ruby/commit/c722fdf9481978d68eb520328b214a0f0f24cef7))
* **api:** api update ([097be9d](https://github.com/Increase/increase-ruby/commit/097be9d442dd790cc8710d7e78eea305cbbc531d))
* **api:** api update ([b1bf5ba](https://github.com/Increase/increase-ruby/commit/b1bf5baa1c22f8dcd12c148b3ca3220d6458d528))
* **api:** api update ([503f0d1](https://github.com/Increase/increase-ruby/commit/503f0d141d7ca6d1bef35a7b2eaca9e3a1355ffb))
* **api:** api update ([c22b95b](https://github.com/Increase/increase-ruby/commit/c22b95b3864af391f7aa60a7f361ce3f40fea688))
* **api:** api update ([083814e](https://github.com/Increase/increase-ruby/commit/083814e96921f1782e1f007a597778e8b93e2ad7))
* **api:** api update ([e51f3f0](https://github.com/Increase/increase-ruby/commit/e51f3f02edc0a5b320b272ccf9a0a864db3f3f5c))
* **api:** api update ([40360be](https://github.com/Increase/increase-ruby/commit/40360bed7d49d1136458423607004b3d557362d3))
* **api:** api update ([3384f10](https://github.com/Increase/increase-ruby/commit/3384f10ca1ed1e5998962b2503198643481f378b))
* **api:** api update ([ab0f690](https://github.com/Increase/increase-ruby/commit/ab0f6906da3efbbba5062e8f7d5a1d985fd23da9))
* **api:** api update ([2b8f969](https://github.com/Increase/increase-ruby/commit/2b8f96957290ac25d5812008d6d7b0a5ae363597))
* **api:** api update ([8ee437a](https://github.com/Increase/increase-ruby/commit/8ee437aad0e89fac6ea0f6f5dfa0cfba28088e37))
* **api:** api update ([ec1ab79](https://github.com/Increase/increase-ruby/commit/ec1ab7912a8923f8a838d68b44751e2f5144d3c3))
* **api:** api update ([b6a1f14](https://github.com/Increase/increase-ruby/commit/b6a1f1472a83fd5e51e478c17cdd70cb44387e21))
* **api:** api update ([860f151](https://github.com/Increase/increase-ruby/commit/860f15138dd2c55daed8e4a24944088e71c70a24))
* **api:** api update ([6a28edc](https://github.com/Increase/increase-ruby/commit/6a28edc6479be4b486179b924ee1728bacb8cfba))
* **api:** api update ([df29f6f](https://github.com/Increase/increase-ruby/commit/df29f6f47a0dcab485f38610dfbf92644c67ed66))
* **api:** api update ([525d98d](https://github.com/Increase/increase-ruby/commit/525d98d628c1a9ea07c220df956e45e9e078e2fc))
* **api:** api update ([90d2d86](https://github.com/Increase/increase-ruby/commit/90d2d860984e843b9359f9c6db6ae184781f03b6))
* **api:** api update ([6814340](https://github.com/Increase/increase-ruby/commit/681434095c647060999aea91efc6ae3880fa800d))
* **api:** api update ([2ab186f](https://github.com/Increase/increase-ruby/commit/2ab186f1c28870a5e61ee2e83df4bf98b2503495))
* **api:** api update ([421c53d](https://github.com/Increase/increase-ruby/commit/421c53dfabe1e13bc3cbe8d6308faadbc811d027))
* **api:** api update ([a3ef804](https://github.com/Increase/increase-ruby/commit/a3ef804fa86eb86295216b12555ec40fe2b600ac))
* **api:** api update ([a1ddec9](https://github.com/Increase/increase-ruby/commit/a1ddec9a7cd6ace5b97f61400b36265e50c350d7))
* **api:** api update ([76d5c9c](https://github.com/Increase/increase-ruby/commit/76d5c9c3ae8349940f19a2908c78704fea81b8c6))
* **api:** api update ([4d96974](https://github.com/Increase/increase-ruby/commit/4d96974ce39970f605867e4c9f6a9e184845be49))
* **api:** OpenAPI spec update via Stainless API ([44336e5](https://github.com/Increase/increase-ruby/commit/44336e50c4ad04f83d64419b20244402de687a71))
* **api:** OpenAPI spec update via Stainless API ([adde9a8](https://github.com/Increase/increase-ruby/commit/adde9a8202502bb745b213a467efe1258d10c92f))
* **api:** OpenAPI spec update via Stainless API ([49b13bc](https://github.com/Increase/increase-ruby/commit/49b13bcd940422db20b88f4fe4cd501d85d66814))
* **api:** OpenAPI spec update via Stainless API ([b0df4e3](https://github.com/Increase/increase-ruby/commit/b0df4e3d384cbbcbc75da961618bb2ee016be244))
* **api:** OpenAPI spec update via Stainless API ([487435e](https://github.com/Increase/increase-ruby/commit/487435e782ef006e6e7f5fcfb28a896a00b86eb8))
* **api:** OpenAPI spec update via Stainless API ([45a96d7](https://github.com/Increase/increase-ruby/commit/45a96d755efbecaebab2e458f6bdfa608ec2328a))
* **api:** OpenAPI spec update via Stainless API ([8ec4ea6](https://github.com/Increase/increase-ruby/commit/8ec4ea64543c56b660b113ed66e9b9e365841b6c))
* **api:** OpenAPI spec update via Stainless API ([35bd275](https://github.com/Increase/increase-ruby/commit/35bd275fc8fa21b998e0e83ad95e1f3ebbfef943))
* **api:** OpenAPI spec update via Stainless API ([4589572](https://github.com/Increase/increase-ruby/commit/458957201deb3329666e5f7ce26c4d0656b9685c))
* **api:** OpenAPI spec update via Stainless API ([d725b9a](https://github.com/Increase/increase-ruby/commit/d725b9a7c10ed517e951cb7c0725fa31225a13bb))
* **api:** OpenAPI spec update via Stainless API ([02e6edf](https://github.com/Increase/increase-ruby/commit/02e6edf791d9a765554b5f8189585647aa697531))
* **api:** OpenAPI spec update via Stainless API ([38035e6](https://github.com/Increase/increase-ruby/commit/38035e63498e3fdc614ca34a868137114d0f8809))
* **api:** OpenAPI spec update via Stainless API ([999dff9](https://github.com/Increase/increase-ruby/commit/999dff909c5450976fd9855c69bf1bbd42c88d3c))
* **api:** OpenAPI spec update via Stainless API ([ffbe950](https://github.com/Increase/increase-ruby/commit/ffbe95083345a63516b5b3cf662a643f1188e757))
* **api:** OpenAPI spec update via Stainless API ([abaf258](https://github.com/Increase/increase-ruby/commit/abaf25851fa0aece7722486139783774421c5ed9))
* **api:** OpenAPI spec update via Stainless API ([d92ac92](https://github.com/Increase/increase-ruby/commit/d92ac92c42bcaa6f3cdbf1e0342fd93bafeb98f7))
* **api:** OpenAPI spec update via Stainless API ([bd6744b](https://github.com/Increase/increase-ruby/commit/bd6744b13f3d4d55277147cd27b8614ba10c2a7d))
* **api:** OpenAPI spec update via Stainless API ([ca00ca0](https://github.com/Increase/increase-ruby/commit/ca00ca00198f5a160cc3aa48b3df68453a5d900b))
* **api:** OpenAPI spec update via Stainless API ([eabd8dd](https://github.com/Increase/increase-ruby/commit/eabd8dd29d23285ca81cc9e41ead39141e7d2cc3))
* **api:** OpenAPI spec update via Stainless API ([2916e27](https://github.com/Increase/increase-ruby/commit/2916e2737bbcc090f83db5cbdc1380124de726fc))
* **api:** OpenAPI spec update via Stainless API ([a519d87](https://github.com/Increase/increase-ruby/commit/a519d870eadd209025581ab879dd365cf6042db9))
* **api:** OpenAPI spec update via Stainless API ([5653e70](https://github.com/Increase/increase-ruby/commit/5653e706152d206329cd2b0d4a1bb077fc08a451))
* **api:** OpenAPI spec update via Stainless API ([3466f74](https://github.com/Increase/increase-ruby/commit/3466f74f6b8cd87b07faf27601afeceb473391a3))
* **api:** OpenAPI spec update via Stainless API ([e1e99c9](https://github.com/Increase/increase-ruby/commit/e1e99c94060d6d2c0eb990b7bfa6e4b2bfa1f014))
* **api:** OpenAPI spec update via Stainless API ([5f372cf](https://github.com/Increase/increase-ruby/commit/5f372cf7f8a977df272c777b004fd0a35be00ffb))
* **api:** OpenAPI spec update via Stainless API ([93d9325](https://github.com/Increase/increase-ruby/commit/93d9325c9a0692ed9de3cb8bbd5844950ae310a3))
* **api:** OpenAPI spec update via Stainless API ([772b392](https://github.com/Increase/increase-ruby/commit/772b392a702eabcb8dbdcbaa8db83833bf248ee2))
* **api:** OpenAPI spec update via Stainless API ([1ce72a7](https://github.com/Increase/increase-ruby/commit/1ce72a7207ebdaf829b4d733f5fe68efbb91d26d))
* **api:** OpenAPI spec update via Stainless API ([64bf021](https://github.com/Increase/increase-ruby/commit/64bf021bca215241fac793f5975f58831e04b440))
* **api:** OpenAPI spec update via Stainless API ([236ff58](https://github.com/Increase/increase-ruby/commit/236ff584e3bd220ae686fd2ea46e384a19717503))
* **api:** OpenAPI spec update via Stainless API ([2797d46](https://github.com/Increase/increase-ruby/commit/2797d469657e40875bc0e1fa81bca94b1fb09d31))
* **api:** OpenAPI spec update via Stainless API ([b691612](https://github.com/Increase/increase-ruby/commit/b69161286de55649d52fd1dea349f15b35e1afd5))
* **api:** OpenAPI spec update via Stainless API ([f6e39ea](https://github.com/Increase/increase-ruby/commit/f6e39ea83fa89c3b7cedff6d0f7ba1795acbff84))
* **api:** OpenAPI spec update via Stainless API ([c6082b6](https://github.com/Increase/increase-ruby/commit/c6082b6f7c323573a676a64571f5209a2c4f1648))
* **api:** OpenAPI spec update via Stainless API ([9fe10a8](https://github.com/Increase/increase-ruby/commit/9fe10a8726fe38c52dcdb1f6dd2acd31d52cb230))
* **api:** OpenAPI spec update via Stainless API ([9d2db14](https://github.com/Increase/increase-ruby/commit/9d2db147af2d53d8e39788bb5e516da625ab054b))
* **api:** OpenAPI spec update via Stainless API ([3b9e3b1](https://github.com/Increase/increase-ruby/commit/3b9e3b102c8ce99c0c254a36a16a5fad4589b15b))
* **api:** OpenAPI spec update via Stainless API ([865f4e2](https://github.com/Increase/increase-ruby/commit/865f4e22de7cc21ed817212729f6ceec9db9a389))
* **api:** OpenAPI spec update via Stainless API ([7b27861](https://github.com/Increase/increase-ruby/commit/7b27861452bd309e7eb26bff3baff71302a23b74))
* **api:** OpenAPI spec update via Stainless API ([85557e7](https://github.com/Increase/increase-ruby/commit/85557e78af93eef87158ea22a42b9495ebc2effa))
* **api:** OpenAPI spec update via Stainless API ([878705b](https://github.com/Increase/increase-ruby/commit/878705bf9db20e171e4242f1c1d4e9d62a1e1bbd))
* breaking change - improved request options signatures ([38a8360](https://github.com/Increase/increase-ruby/commit/38a836099cbba0f34da972fa57f79633c9dbb9be))
* bundle typing manifests with gem release ([66a02a8](https://github.com/Increase/increase-ruby/commit/66a02a82c7afe3d120e486967b2e4be63f8044cd))
* **client:** follow redirects ([49f1693](https://github.com/Increase/increase-ruby/commit/49f1693ee6d698e467ac32994f0808396dc1b816))
* **client:** generate classes for enums ([fe1b758](https://github.com/Increase/increase-ruby/commit/fe1b7589c61c6d8e10472ff5a0363ba4aac3228d))
* **client:** parse dates in responses ([d0d29c0](https://github.com/Increase/increase-ruby/commit/d0d29c01639b89207a1205d3a9512a3cf87547c2))
* **client:** public model initializer ([876cc83](https://github.com/Increase/increase-ruby/commit/876cc838170e8cc78beaf652da9ee172c08bb433))
* consistently accept `AnyHash` types in parameter positions in sorbet ([ff5ce81](https://github.com/Increase/increase-ruby/commit/ff5ce813290e323bd6a55f04826be42615478493))
* fix `to_enum` and `enum_for` built-ins for pagination classes ([63a2bea](https://github.com/Increase/increase-ruby/commit/63a2bea4dd779090e38fb806f2af5a56ad0b47b0))
* implement `to_json` for base model ([b727bb3](https://github.com/Increase/increase-ruby/commit/b727bb3d1a8b89ff32c1f6cacdb754960683c656))
* **internal:** converter interface should recurse without schema ([f4508e7](https://github.com/Increase/increase-ruby/commit/f4508e74acdf88f446dffb4d6f1f08ec0c3dcb63))
* **internal:** modified tests for thread and fiber safety ([5c9af5b](https://github.com/Increase/increase-ruby/commit/5c9af5bdbe35f27de1e1e1c8a5d832dfa1450b01))
* isolate platform headers ([a7b5932](https://github.com/Increase/increase-ruby/commit/a7b5932d6333193f134f410b14017916b09c674e))
* link response models to their methods in yard doc ([0919ab2](https://github.com/Increase/increase-ruby/commit/0919ab2460d5e1fb5b97f092fc8b3c764b4ae1cc))
* make `build_request` overridable ([4694ebb](https://github.com/Increase/increase-ruby/commit/4694ebb2510aab16db574c9d9ed480e038a69594))
* prevent tapioca from introspecting the gem internals ([98440bf](https://github.com/Increase/increase-ruby/commit/98440bf2578f3363a6c193013f989a11af0c71e0))
* ruby add nilability annotations ([4194c83](https://github.com/Increase/increase-ruby/commit/4194c837c7b03bb9b1e2b877d9e47185dc7ed22a))
* run rubocop in multiple processes when formatting ([5c9cc2a](https://github.com/Increase/increase-ruby/commit/5c9cc2a5f7de38ae5f6b2f3de9ede9117447d22b))
* support `for item in stream` style iteration on `Stream`s ([6fee12c](https://github.com/Increase/increase-ruby/commit/6fee12c99a7aabf80ba1dd9509c89b858800a5a3))
* support client level methods ([4996010](https://github.com/Increase/increase-ruby/commit/4996010019fb813508d0f104ea55a76c53cd2499))
* support const enums ([5bc660a](https://github.com/Increase/increase-ruby/commit/5bc660ab15424637f111fbef532a4dac99475016))
* support jsonl uploads ([29f419b](https://github.com/Increase/increase-ruby/commit/29f419bf5f2b150e43a013628e25d84751655a3f))
* support overlapping HTTP requests in same Fiber ([50fb02b](https://github.com/Increase/increase-ruby/commit/50fb02b25f177425eecd50dccde0003841a1fd6c))
* support streaming uploads ([b81f8da](https://github.com/Increase/increase-ruby/commit/b81f8da7dcd228e3b57212f25e03696e047f6505))
* unify param & return types in yard ([6af0904](https://github.com/Increase/increase-ruby/commit/6af0904a6d8b2f4373c15e2d570510ff2efd3e44))
* use tagged enums in sorbet type definitions ([11feab2](https://github.com/Increase/increase-ruby/commit/11feab25ad42d24b90de84ad5dacb80affe1a9f0))


### Bug Fixes

* bad documentation url for gemdocs.org ([303b154](https://github.com/Increase/increase-ruby/commit/303b1548522b3cbbe99f9de55fdd93b3b529734f))
* base page should be module instead of class ([c2535fb](https://github.com/Increase/increase-ruby/commit/c2535fbea54a1a58af3a385bb74d07a04ed9f277))
* better support header parameters ([7c1aa2c](https://github.com/Increase/increase-ruby/commit/7c1aa2cc5d0269d44b9049e147b9d1ddf9f8af7e))
* enums should only coerce matching symbols into strings ([5293405](https://github.com/Increase/increase-ruby/commit/52934050e2560f1a0ddd62cc086f3f9d5af3da81))
* label optional keyword arguments in *.rbs type definitions ([febf36c](https://github.com/Increase/increase-ruby/commit/febf36c59de99eb1195e073d4c12b4b9baf894bf))
* **model:** base model should recursively store coerced base models ([2bdcd0b](https://github.com/Increase/increase-ruby/commit/2bdcd0b2a2ffd42c13f53f070e56d18515d01fee))
* pages should be able to accept non-converter models ([28884d5](https://github.com/Increase/increase-ruby/commit/28884d564078b1a2977a3415d6409cfde8383c0b))
* path interpolation template strings ([0cee778](https://github.com/Increase/increase-ruby/commit/0cee778042664c56a07aec052eaa22854d4e249a))
* rectify a mistake where wrong lines were chosen during rebase ([e9c4c41](https://github.com/Increase/increase-ruby/commit/e9c4c416ffcd319051d69ad761743261e41ade52))
* resolve tapioca derived sorbet errors ([ef0ba2d](https://github.com/Increase/increase-ruby/commit/ef0ba2dcf2845a163eb3afa526ad7918acc5ac17))
* ssl timeout not required when TCP socket open timeout specified ([963a4dd](https://github.com/Increase/increase-ruby/commit/963a4dd7932fab72c6647651ad39d6d5133c9dad))
* switch to github compatible markdown engine ([ceb15fc](https://github.com/Increase/increase-ruby/commit/ceb15fc7b8efc719e9a3b6f266ccfb6fcc5cdc6b))
* temporarily run CI without bundler cache ([401bc94](https://github.com/Increase/increase-ruby/commit/401bc9459d2cb00887b98311f10fc36a888b398f))
* yard example tag formatting ([1893a30](https://github.com/Increase/increase-ruby/commit/1893a300a366bdd6795f34cdb24b3c430cafc708))


### Chores

* `BaseModel` fields that are `BaseModel` typed should also accept `Hash` ([b6904d9](https://github.com/Increase/increase-ruby/commit/b6904d9b20822a82358183c0a27d168803ed9c40))
* add `[@yieldparam](https://github.com/yieldparam)` to yard doc ([a918fbe](https://github.com/Increase/increase-ruby/commit/a918fbe0eb47923c730448aaab57738ce8d4b57a))
* add `sorbet` section to README ([8215400](https://github.com/Increase/increase-ruby/commit/8215400416499fc427ea13a9a0e14287859830cd))
* add example directory ([80510db](https://github.com/Increase/increase-ruby/commit/80510db0f9f3c1687ac93cad0afaefee7c49c8f9))
* add more examples to README.md ([f742764](https://github.com/Increase/increase-ruby/commit/f742764fe64a49af2ab56d51a961d5d3dd6ff375))
* add most doc strings to rbi type definitions ([f3215a9](https://github.com/Increase/increase-ruby/commit/f3215a932a14a45d0211052c314c3e390b28b9ef))
* add type annotations for enum and union member listing methods ([e2ea486](https://github.com/Increase/increase-ruby/commit/e2ea486bcab090301370dcffd8132bd673fc0c30))
* add type annotations for requester ([5f7b034](https://github.com/Increase/increase-ruby/commit/5f7b03465a822595055bd5451ce6d52f09fe6c50))
* be consistent and use lower case headers everywhere ([c64c945](https://github.com/Increase/increase-ruby/commit/c64c9459ad495805d5f68c29b1a60a60e9daf3da))
* bump lockfile ([289eef7](https://github.com/Increase/increase-ruby/commit/289eef7a2b3602856c7a252dd9749b528d88aee7))
* bump lockfile ([c96a8b1](https://github.com/Increase/increase-ruby/commit/c96a8b1cf59be7986fb649984eba42a34b076d80))
* **ci:** bump prism mock server version ([3ca54d5](https://github.com/Increase/increase-ruby/commit/3ca54d56c1b282fcd5c34ede1ab4ea347e72ae37))
* clean up client tests ([647d52f](https://github.com/Increase/increase-ruby/commit/647d52f62b25384edb27ea9ed08585df835b5b89))
* disable dangerous rubocop auto correct rule ([54ee90e](https://github.com/Increase/increase-ruby/commit/54ee90e2c0cf56d744a9b813497406770d1f839a))
* disable overloads in `*.rbs` definitions for readable LSP errors ([add41d9](https://github.com/Increase/increase-ruby/commit/add41d95d5923d1286cf83b5df7b983c5e08077c))
* disable unnecessary linter rules for sorbet manifests ([90fea23](https://github.com/Increase/increase-ruby/commit/90fea23ae22256394528761370e30c93cf15d31f))
* do not git ignore `bin/` ([c1f2539](https://github.com/Increase/increase-ruby/commit/c1f2539322b26a7085e3d672ebb6e53744509e28))
* do not label modules as abstract ([3454e56](https://github.com/Increase/increase-ruby/commit/3454e564a81f4d529e8bd74e3de41bdc1fcddcf4))
* document Client's concurrency capability ([aa28822](https://github.com/Increase/increase-ruby/commit/aa2882260641a5a5ca8d159ca7f63a7f59ece4b1))
* document union variants in yard doc ([b3dc9e1](https://github.com/Increase/increase-ruby/commit/b3dc9e196276c0015b12f0d1807d77c625e2a1ae))
* enable full pagination tests ([07c36ab](https://github.com/Increase/increase-ruby/commit/07c36abcdf4fa3aa00980d200836a39dcc90d583))
* enable full pagination tests ([61193bb](https://github.com/Increase/increase-ruby/commit/61193bb02b78affd9c2e04b6ffbaf85ffd73d938))
* ensure doc strings for rbi method arguments ([fc029c6](https://github.com/Increase/increase-ruby/commit/fc029c6d469a6906721623f33f7bba010fa122e8))
* error fields are now mutable in keeping with rest of SDK ([4766cae](https://github.com/Increase/increase-ruby/commit/4766caec3bab7fb030dc5cc5cb057fae865f113d))
* extract error classes into own module ([4334218](https://github.com/Increase/increase-ruby/commit/4334218a572ee48872c1e33d4013b7c63d83c6ea))
* fix a yard doc comment ([8cd97fd](https://github.com/Increase/increase-ruby/commit/8cd97fd5f4a73c97ea92fe26f7504832e9906ab4))
* fix misc rubocop errors ([42734c9](https://github.com/Increase/increase-ruby/commit/42734c9ce607c4a6d574428129c1355948ceccb0))
* fix repo names ([eb6a5cd](https://github.com/Increase/increase-ruby/commit/eb6a5cd0e6dc787e2066eb5b0c290779596ab1bc))
* fully qualify `Array` and `Hash` in rbs files to avoid collisions ([39ce5aa](https://github.com/Increase/increase-ruby/commit/39ce5aa74a7e9bf2d12694b7e94dffd33498cb57))
* fused enum should use faster internal iteration by default ([5b3000c](https://github.com/Increase/increase-ruby/commit/5b3000c07c2ae2636173a870ec2f703b8ba1bbae))
* generate better supported rbi signatures ([23a0909](https://github.com/Increase/increase-ruby/commit/23a09091a159ae7d6f644e9ffc4855f141e3641c))
* go live ([#1](https://github.com/Increase/increase-ruby/issues/1)) ([f013e29](https://github.com/Increase/increase-ruby/commit/f013e292e080785111a8c261385b470fd6958a34))
* ignore some spurious linter warnings and formatting changes ([a9f97a7](https://github.com/Increase/increase-ruby/commit/a9f97a7f6107eb92044d700fb20aa8dc6949a280))
* improve documentation ([2b7f6d3](https://github.com/Increase/increase-ruby/commit/2b7f6d30eec0e2b23bd39e07e3ed4ea9e18a45ae))
* improve rbi typedef for page classes ([6ff3fa0](https://github.com/Increase/increase-ruby/commit/6ff3fa03a3ff7060d795641de31dd93b603cbdc3))
* improve yard doc folding and reduce repetition ([2b9cee0](https://github.com/Increase/increase-ruby/commit/2b9cee09c821eb7f9d8cf6e60a81d430e287dfe2))
* improve yard docs readability ([5dc8d93](https://github.com/Increase/increase-ruby/commit/5dc8d937a2f2c4bca5fea70fd12cd7da1738fcd5))
* **internal:** add sorbet config for SDK local development ([bba1099](https://github.com/Increase/increase-ruby/commit/bba1099e66a3c171cc5774725df9d581d7accde5))
* **internal:** add utils methods for parsing SSE ([631097b](https://github.com/Increase/increase-ruby/commit/631097b3fc09c124c849a1c5877aacc80c4bdc07))
* **internal:** codegen related update ([79efe59](https://github.com/Increase/increase-ruby/commit/79efe59fee012003857b99ed70c151482745cc60))
* **internal:** codegen related update ([b605942](https://github.com/Increase/increase-ruby/commit/b60594243fd25ab52ebba7347b1e78b4f647480c))
* **internal:** codegen related update ([818700b](https://github.com/Increase/increase-ruby/commit/818700b283ac3b6ae7e80fcb6cd4b0ceb18129b6))
* **internal:** codegen related update ([7e0cc97](https://github.com/Increase/increase-ruby/commit/7e0cc974c7c2b03896eacf518c820c78b2554c10))
* **internal:** codegen related update ([ff640aa](https://github.com/Increase/increase-ruby/commit/ff640aa40a267fd959f6ed41c7e6b33f29f0d151))
* **internal:** codegen related update ([19d4386](https://github.com/Increase/increase-ruby/commit/19d43863411a8519607b3b175030026748f783b3))
* **internal:** codegen related update ([20b0b2b](https://github.com/Increase/increase-ruby/commit/20b0b2b9340752091784b0574f766fc55cf9def1))
* **internal:** codegen related update ([f99885b](https://github.com/Increase/increase-ruby/commit/f99885bb92a7a415dd6c6c06b4720324da6b34c6))
* **internal:** codegen related update ([185fe44](https://github.com/Increase/increase-ruby/commit/185fe44d4ede731cd1234ffdbd7c35884a549420))
* **internal:** codegen related update ([1df9e9a](https://github.com/Increase/increase-ruby/commit/1df9e9aaea743518f65d0febbef835b25a395c80))
* **internal:** codegen related update ([0c5a979](https://github.com/Increase/increase-ruby/commit/0c5a97973ea6ba25b2a77903c4739c8d7ed1268d))
* **internal:** dependency updates ([3012533](https://github.com/Increase/increase-ruby/commit/30125336da92c27eca7302f33de3aa1682f4d62a))
* **internal:** formatting ([c19c68d](https://github.com/Increase/increase-ruby/commit/c19c68de5ebee248bb9e76bb762a0df38553d315))
* **internal:** group related utils together ([a8fd7d1](https://github.com/Increase/increase-ruby/commit/a8fd7d1e8f30d55311ef4153a1a8828f64e2a389))
* **internal:** make lint rules more strict ([074ac7f](https://github.com/Increase/increase-ruby/commit/074ac7fffc597c5218f2678464c3a9106c24517d))
* **internal:** minor refactoring of utils ([b108061](https://github.com/Increase/increase-ruby/commit/b10806108c477b7a83fe12e586afe10631ba84e9))
* **internal:** prune unused `extern` references ([967342d](https://github.com/Increase/increase-ruby/commit/967342d58749305161ae5fd70b4b4e0fb5344c1e))
* **internal:** refactor request stack ([ef2aa71](https://github.com/Increase/increase-ruby/commit/ef2aa712ecdd68b061468fb5f5919cfa18d73f75))
* **internal:** remove extra empty newlines ([93ed3cd](https://github.com/Increase/increase-ruby/commit/93ed3cd76c7b12c8c19015db6adb94fe195edacb))
* **internal:** temporary docs change ([30d8b8a](https://github.com/Increase/increase-ruby/commit/30d8b8a381ce869bfe0bc0f39dd240b7f143af02))
* make MFA optional depending on token ([4f408c4](https://github.com/Increase/increase-ruby/commit/4f408c431ebdfa216d56c2a1c22d04b8ae463e92))
* mark non-inheritable SDK internal classes as final ([becca0d](https://github.com/Increase/increase-ruby/commit/becca0d11713ee6c0826d7d780c290ec6c412080))
* minor formatting changes ([54c3568](https://github.com/Increase/increase-ruby/commit/54c3568b566f24f800c160377c8aa13005ae9d04))
* modify sorbet initializers to better support auto-completion ([c38343c](https://github.com/Increase/increase-ruby/commit/c38343c75694cf1f778017a0cc31c85290b19c84))
* more accurate type annotations for SDK internals ([743b918](https://github.com/Increase/increase-ruby/commit/743b918bf9bba600b8ce999455aaf76f5b48ff14))
* more aggressive tapioca detection logic for skipping compiler introspection ([1ed897f](https://github.com/Increase/increase-ruby/commit/1ed897f7983a17906e962e652e96e340b479d840))
* more detailed yard docs for base client ([49fbe39](https://github.com/Increase/increase-ruby/commit/49fbe3967d128bfadddb31eb6f54717d9d3e0aeb))
* more detailed yard docs for sdk utils ([5f1ed50](https://github.com/Increase/increase-ruby/commit/5f1ed50d930d4a0a9dbd01708c7c53d41556c230))
* more readable output when tests fail ([39071ee](https://github.com/Increase/increase-ruby/commit/39071eee219a1894b3e3e2d5454a3bbf55d602d1))
* move basemodel examples into tests ([02c2992](https://github.com/Increase/increase-ruby/commit/02c29926239b1e9724703238dbc5d2ed63692b1d))
* move examples into tests ([04f620f](https://github.com/Increase/increase-ruby/commit/04f620f835ffbda995962a9536f79bdf07248ca3))
* order client variables by "importance" ([15699e9](https://github.com/Increase/increase-ruby/commit/15699e99a329b40cdfb21b337a74042a05afe0bb))
* pagination ([f052396](https://github.com/Increase/increase-ruby/commit/f052396772aa518676d3f1a77304aca4ab548d55))
* re-order init params in accordance with their optionality ([5f7dc2a](https://github.com/Increase/increase-ruby/commit/5f7dc2aca6193500cb39de4f47f5af4df7557c2e))
* re-order resource classes constructor position ([df27132](https://github.com/Increase/increase-ruby/commit/df27132bb90c2d396efa1c184cec72d1580924cb))
* rebuild project due to codegen change ([1e1e5e8](https://github.com/Increase/increase-ruby/commit/1e1e5e8bddb943247e209ce327e65634c35a46f1))
* rebuild project due to codegen change ([d91986b](https://github.com/Increase/increase-ruby/commit/d91986bee5eda324e929e35876543de729ed7743))
* rebuild project due to codegen change ([92d5a73](https://github.com/Increase/increase-ruby/commit/92d5a737626fe806a882828817aa3cb6eee24366))
* rebuild project due to codegen change ([2207858](https://github.com/Increase/increase-ruby/commit/2207858f1b8c59b7aa4b74d9423937f6e0fde0f0))
* recursively accept `AnyHash` for `BaseModel`s in arrays and hashes ([3eac9c3](https://github.com/Increase/increase-ruby/commit/3eac9c3fdd0e8d73e072084b6d46840445d7558d))
* reduce verbosity in type declarations ([01b3e00](https://github.com/Increase/increase-ruby/commit/01b3e0093e0a82dba02fe872519d299e6fa22de3))
* refactor BasePage to have initializer ([97b31e5](https://github.com/Increase/increase-ruby/commit/97b31e5bae71337f436dfdb0e3bcd88ba03d4d00))
* refactor util method signatures ([7c6b45d](https://github.com/Increase/increase-ruby/commit/7c6b45de77ccd01498237aaabe4930505c844ed1))
* **refactor:** improve requester internals ([002ca1c](https://github.com/Increase/increase-ruby/commit/002ca1c2d52ec2163c2e990f15a290715579e3db))
* relocate internal modules ([8e01721](https://github.com/Increase/increase-ruby/commit/8e017218d68f4f4a848e1f3bbf0fb88ea47d5c4a))
* remove custom code ([57924db](https://github.com/Increase/increase-ruby/commit/57924dbd77ce84feeb0f9718ddc5c92228778660))
* remove stale thread local checks ([e4d73e8](https://github.com/Increase/increase-ruby/commit/e4d73e8951f523d0be1bfc44f488327e60c5b053))
* remove unnecessary & confusing module ([a1a4624](https://github.com/Increase/increase-ruby/commit/a1a46249923775cffe897c52d65330b635f023a3))
* rename internal type aliases ([f52047a](https://github.com/Increase/increase-ruby/commit/f52047af4e44a51f48ea8ca28f74ab89c8eb13ec))
* rename misleading variable ([90215de](https://github.com/Increase/increase-ruby/commit/90215de6314e6456a6ab867d6a7c992bdd765919))
* reorganize import ordering ([1c859e4](https://github.com/Increase/increase-ruby/commit/1c859e4885266a2243a8941630658de0ddd6424b))
* sdk client internal refactoring ([29d4430](https://github.com/Increase/increase-ruby/commit/29d443029ff483b8f7d6faf73535daf14a2d8772))
* sdk internal updates ([635fb9c](https://github.com/Increase/increase-ruby/commit/635fb9cba7f2350d0e7c98a0de605b97d8c280a3))
* slightly more consistent type definition layout ([af1f206](https://github.com/Increase/increase-ruby/commit/af1f20623992a4acc18ba2699b49ec1e83d9f5be))
* sort imports via topological dependency & file path ([08ccc35](https://github.com/Increase/increase-ruby/commit/08ccc35fb98a942afa33dc890d062244d8608d7a))
* support different EOLs in streaming ([f6a6234](https://github.com/Increase/increase-ruby/commit/f6a6234a02c46bd2848e891a883c223348d0eba3))
* switch to prettier looking sorbet annotations ([fb3008a](https://github.com/Increase/increase-ruby/commit/fb3008ae3d34f592c4e02b58013950771492e31c))
* touch up sdk usage examples ([96275e1](https://github.com/Increase/increase-ruby/commit/96275e19b6f2b73e831b25f05f9d443ffaf817a8))
* touch up yard docs with more spec compliant syntax ([fc2125a](https://github.com/Increase/increase-ruby/commit/fc2125afe0c2af4c9ed82ce057d32475f5c71aa3))
* update custom timeout header name ([965cdc0](https://github.com/Increase/increase-ruby/commit/965cdc0ddf90053644b0189157d1c997e2d6c046))
* update readme ([e1b593d](https://github.com/Increase/increase-ruby/commit/e1b593db90cd0d9a3f1153d02d563d097261342b))
* use concise syntax for pattern matching ([b6361ac](https://github.com/Increase/increase-ruby/commit/b6361ac4d543b773febb51984fa4362276b486de))
* use fully qualified name in sorbet README example ([3ea3b43](https://github.com/Increase/increase-ruby/commit/3ea3b43498a6968fcf003b9450ec58ed67094cff))
* use generics instead of overloading for sorbet type definitions ([464ce6d](https://github.com/Increase/increase-ruby/commit/464ce6d41e53c0a70be9933c546fd3f117028456))
* use more descriptive rubocop output format ([609c929](https://github.com/Increase/increase-ruby/commit/609c929d5b79cbf60ed775b91531b274e116c345))
* use multi-line formatting style for really long lines ([36e68d7](https://github.com/Increase/increase-ruby/commit/36e68d75fb5d4e86b1ae13aecda669b5c4488d00))
* whitespace changes ([1e9d815](https://github.com/Increase/increase-ruby/commit/1e9d815280ccd0cc93df7f718556094d3056d1b9))


### Documentation

* update URLs from stainlessapi.com to stainless.com ([6572731](https://github.com/Increase/increase-ruby/commit/65727318d9954bb71e2db176114fb0df406807c7))


### Refactors

* **client:** impose consistent sdk internals layout ([b05e4e5](https://github.com/Increase/increase-ruby/commit/b05e4e59bdb1091749b3cb9b1f276234aefd74ba))
