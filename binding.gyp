{
    'variables': {
        'openssl_fips': ''
    },
    'targets': [{
        'target_name': 'addon',
        'cflags!': [ '-fno-exceptions' ],
        'cflags_cc!': [ '-fno-exceptions' ],
        'sources': [
            'src/addon/td.cpp'
        ],
        'include_dirs': [
            "<!@(node -p \"require('node-addon-api').include\")"
        ],
        # 'libraries': [],
        'dependencies': [
            "<!(node -p \"require('node-addon-api').gyp\")"
        ],
        'defines': [ 'NAPI_DISABLE_CPP_EXCEPTIONS' ],
        'conditions': [
            ['OS=="win"', {
                'sources': [
                    'src/addon/win32-dlfcn.cpp'
                ]
            }]
        ],
        'xcode_settings': {
            'MACOSX_DEPLOYMENT_TARGET': '10.14',
	    'GCC_ENABLE_CPP_EXCEPTIONS': 'YES'
        }
    }]
}
