#
# Cookbook Name:: haproxy-ng
# Attribute:: source
#
# Copyright 2015 Nathan Williams
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

default['haproxy']['source'].tap do |source|
  source['release'] = '1.5.12'
  source['version'] = source['release'].to_f
  source['checksum'] = '4b94b257f16d88c315716b062b22e48a'
  source['url'] = 'http://www.haproxy.org/download'

  source['dependencies'] = value_for_platform_family(
    'debian' => %w( libpcre3-dev libssl-dev gcc make ),
    'default' => %w( pcre-devel openssl-devel gcc make )
  )

  source['make_args'] = %w(
    TARGET=linux2628
    CPU=native
    USE_LIBCRYPT=1
    USE_LINUX_SPLICE=1
    USE_LINUX_TPROXY=1
    USE_PCRE=1
    USE_OPENSSL=1
    USE_ZLIB=1
  ).join(' ')
end
