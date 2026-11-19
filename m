Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE21606A320
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K9fJ0OTy;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=CKXbSy5u
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8E711250B;
	Thu, 19 Nov 2026 15:11:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7178C11250B
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 15:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795101073; x=1826637073;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Tg92HO7nKaeMLeKYu/hB1Xye8ST8azI4Q0zxUm0djqw=;
 b=K9fJ0OTyvrJ03ebIAgQGwxNDAeH0jSvanR1I41qijTpY0Fi7R30BL7LZ
 Dba1As8R4G5F2HoiSaZN4jQe3Y7FzsvR+832S6IIoT9jIPZBZdohGUEqy
 4tIM8BBYjFUo2n46Rr3q9u5/iyZKpfg/w+AsP1e7WMA57ELEnn4ZtAm4X
 wptqqfO7fbK4lIjlfUVWT/z/XNrW7v2EufalTg9JiiiNB08Z52lYxeiA+
 s2lQ2mQUa/MKCQfISz8Gi1HtpYmErPvH7ybauKPm6aghdEZDsNWx0FYGV
 SKE28x3TAAOcP3PwtXrVWQfRdUxqXnO5AzEdl1u7vr5Tyb+MSStD5wLcU Q==;
X-CSE-ConnectionGUID: wqwEMZtWTRyY0gUSZ9Mxwg==
X-CSE-MsgGUID: 5KO72VMTQ+qyeJJWAZ6mhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3959966"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3959966"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:11:12 -0800
X-CSE-ConnectionGUID: ryA0S40WRTeIzL+yPVy4rA==
X-CSE-MsgGUID: FDAEGdb6SFWJ5r2DEhuRNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10679015"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:11:13 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 07:11:12 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 07:11:12 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 07:11:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhNGrnP5zW2nHwVK8/6akiUm3Ec5fb32P6Bbp1vIkgZiR9x4wp7Oa9xVGpHhmYlFl2dI8rHiQf6vdzkmOMDh4X9EXo54F9iLE6TCBZ4NP5Gk4Hrw7QaC3dx4oAi1UlqJYZ/1cJklM1Z+aY8gVSQnTV6StoSED1WJaqjQp+6rBYW62qvMMSjBr0eylrQn8U0LWl9WVySn+YT7TYTf7rV+UqzbiS8HDZzlrdniDNS1zObUBoeqPGel2BeN6ODbyQPF3giF/9N077yvzhnANv+VgHSprnqgh50oarRunLWn06nAfaqWASH7or09XVa4J3lEhAxety7PqWRf8FAf9Cdxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0RjoxNfSNu4ui1TLucXn7zT7ax7OvTkicNe+WhdTMM=;
 b=Wf+57ZMSQlJReRVPfzRW1k6Gg8CIWsmZOCjfbvqdlz4XQrffdVkSzoXr7/QFLOV1yPW2OgvToU1Y7fut1AHjnxT4Gl7nWfW33sry2vHQOulM0SHdF+a5dIBEy/XlndseNnD9AltsmceAPUsQ+YTVGl5QwumdwoBXcgiPJIxY/u+A0TJcDQf6g8x2XcQsYJkyHd0lcaYGQSE8VVz/JMdiFmx/WqU0XlCnlyC1f7LaZrq8BhvfBVpelhKiP96tPY9kos5O3e+2ac7qLotsFFmrH3kfGBFPe1xD/IP+QVLV64laMn1HsdyaexJ3tIl5537Ax6RoyhVk04LpEoM5c/blpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0RjoxNfSNu4ui1TLucXn7zT7ax7OvTkicNe+WhdTMM=;
 b=CKXbSy5uRbfYSlnctltkL42ibyH0E72GTf4D6EoX8nNrvzdnBUJeG/2ZSYoNkUZsk/HxfDH6oHTI5aXKCYsXZ8ADoO4NLZ2pDfZ+a/Cv9HB5Mjg763AbfWvrRsjzwXHgLp4g3oPs0uSs6xjZUKRvUJsOLLYPgozfiemLuo/tHNw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by DS7PR11MB7739.namprd11.prod.outlook.com (2603:10b6:8:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 15:11:09 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 15:11:09 +0000
Date: Thu, 19 Nov 2026 16:11:02 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: Andi Shyti <andi.shyti@kernel.org>, Krzysztof Karas
 <krzysztof.karas@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <andi.shyti@linux.intel.com>, <chris.p.wilson@intel.com>
Subject: Re: [PATCH v6 3/3] drm/i915/selftests: take error_mutex in stolen
 reset test
Message-ID: <av8Q31bD3rlfFw6j@kniemiec-mobl1>
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
 <72a2b16b5a4cf8deffad74e8ae85a586a5d693a2.1795006734.git.sebastian.brzezinka@intel.com>
 <ocssumcrob46pblkatgoctmk5rb5gzaeeoe7ifinknfd65e3tq@ndmwuirrfepo>
 <DMZ4KGKCCK8A.2E0HP1AV6ZRQD@intel.com>
 <av7WNeQtujfjHyWn@zenone.zhora.eu>
 <DMZ510W56JPY.Y80JF2RM7J44@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DMZ510W56JPY.Y80JF2RM7J44@intel.com>
X-ClientProxiedBy: DU7PR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::10) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|DS7PR11MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf63d1d-40c9-4986-f4c2-08df464f5700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|11063799006|56012099006|261022115727099003|261022075727099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 6x2dEG1tHj7q2pxQ1dL9L4GIJIjtrPbchWBhhCddaNl7PCAoK0ZDtGWXPHRnFrWkoZq4ZH2aK8SomzX5jxC4m5vKXg+Rc9spnHMCpT9G0RNDjewJW6DNNfIuLbjkVD9x/rBnuaAXA+msA65oh6XeXsaTBAMwVhSdNBIlmKbY0GYhQfas4DK0PukRoq95sSFkdGdZMWBhZa/xpjuCRRzYniaGg1DvXBqL8/fixHbkUK5Bv7HK0joCvyyIyYWK2OxcGnjGswqy3UtM5HhOdFSzl4ZcSUyDL2MA366NFxpUzQBP+DZbNcyJhgd4qTjYDquJXEUntYKObC0FH5+gdaIMgfvJiW4ybNQgZPnrZNEr7gx5BsgkrbZZYpuI15/fxxOJwLy4mIzZuxb3RWbBO9iMBHWUmdaq5neUFV+kgbkBr4AywjA9uHM/1UqNuQP10BoDtkB5UKyr0nIAUO4HZrMCDEBOeba9LDN9C5NCNEMySAIS7aE2/NJhCBs/KoRSypberlwLGsPRWGQ6xkVxZKrYZwPrDLWyUQ9gtxf8y64raJ/980Bz1r8weBMd/jhezGh86nPOO2doZCW4VBI4TFoGVjhgBlrwtb/QL2k7PWKAQqPSRWMLl1q2iT55AmZ8t7qhhmFQg3oYLbAHrRrwuh2Zx39qZjGskNajrOduaETqlrg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261022115727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0FLNG1sYXBaMGd1dDNHRXBrcklWTEM0TkhncGtPdmQvdy9jWFFZbk5UVW8z?=
 =?utf-8?B?elhjZ25xZUpZRTJhY1ZHUnNoUnp3WEl0K0JRWVFuVU1HUVJwZDdqUXVuV2FY?=
 =?utf-8?B?aVM5YlorR0VCVTg3SVJSUjlJK05kVDRBVTJsTUNSZm84d2RlZUdMTE9oOU9x?=
 =?utf-8?B?NmROYkpwSkw4UjdPK0NSNTBMVFBxTHJNZ0NCTXp6QndUQmhYbkduR0xPMXlF?=
 =?utf-8?B?K21Cd2U5SkRvUGxydEhWTFl5NDRnM1l1QTVVOFFhUzdQYW5zTkJjRkV6blFx?=
 =?utf-8?B?QUhIZFpkTUFVL1ZPY1R3ekxYOUd3TFEyVlY2V1FIUEdtQjR2WE16MWQ0STJh?=
 =?utf-8?B?TmZpNFU4NzF2U21uWWtZZTI2ejBYNzFUQlY5Y2pmaldxU1M2Zkd1K1hmSDZ1?=
 =?utf-8?B?V2Y1dE12K3RvUU9qWEJuZ1didk5aK043MGgxdWt6c1V6SFpjL1Npa1lPWFhX?=
 =?utf-8?B?OVFUY3NveTZnalJIRlp0SjNoTVJTNmhBaEJJMlM0KzV3NHlnUUlXV2VNdlZK?=
 =?utf-8?B?VW5sZmJaalRuUTFYTlJzNFJzVGdscStabnluNy93bHMwU1RYcW96R0xuMEth?=
 =?utf-8?B?TFlBS05NUG9zZVkybWFsWUdISzJRd1pOd0xMdXl3REc4Wk1rQUFnZWRLdkp0?=
 =?utf-8?B?bnhaYmdsOXpXZnlNRHhrWTF1ZXBScUNWN2FUaXNZN0FhdUxRM3VkSFl4M01l?=
 =?utf-8?B?WnliemFranQ4QlJld0pwV1NlaC9GWUE5TG1NQmg0NHA0REVXS0VMVFNlYllL?=
 =?utf-8?B?RjBRMGIvUDlIZk5uQzVUUjQzV3VacXdFMnJrT1c3QXVzdUttY1VidjlLYnNu?=
 =?utf-8?B?V1lMTU1yZ21HN1hyQ1dtZno4S1F3bnF2V2FrTndXYkNoQmJvYnVLQU1aSnJp?=
 =?utf-8?B?c2hLTWZCSHZzcDNEa1c1aC9jVkx2TEcwMThVQldnck1ZTTVpcTlWWjd5VHE4?=
 =?utf-8?B?aXhTcUkzK3RWL3luUE9qUlpCb2c5UitpVSt0K1V6UDVwL1hLRnVHYlZtbjBl?=
 =?utf-8?B?bVljcU1LM0NKeW40V0hEWXFxU25hRk1oaHI3RVJtTVEyeDNKN1N3YlFvQkth?=
 =?utf-8?B?d1lvLzN3UlE1aTBVMjZHZ2FwaU9pbmxBUlIyQVZ5MzRYaFdlRUdyRWJKaG5n?=
 =?utf-8?B?cytBcnZpMkxmSFd2R2pqeFk1UVhVaU5Cb3B4aEFLdGNPaWFlTUpUQlVJVHJw?=
 =?utf-8?B?N3U1Smw5ZmFhb3V6T2QzTW94NFVOWnF2ZjFyTGdLdEM4ekpKbTR1U0JTSEMz?=
 =?utf-8?B?a01lbHhpTDJ4VndMS0NZK0luV2NMc1N0UERmR0E2VTBWdXUvQUs0Si9ncWRw?=
 =?utf-8?B?UUQzWG1Pek9JU1lQOWcxZ213MGswcnZZNTRtWjUvOU45bWo3aDJ5dlJjUUs3?=
 =?utf-8?B?cUcxaDRLSk9rd0U2aEs3Uk41TG1XYVVoNUw5M2k4K3NqSUVBbzZiTjl6bGxF?=
 =?utf-8?B?aGVjREtTOGZOUTR0cS9LYmZoMlFuVGxTZncrMVNFMHRLaXJRem1iNERCbVU1?=
 =?utf-8?B?RVg5eFRtaVRaSGpVandmTzFRcFQwK3lWUytLMmpJc1ZoY3doVC9jQW9yU3RI?=
 =?utf-8?B?VDNLNDFZQ3haSUI5VTh0UlRMWTZhYXFIbm5xSE5kenBRTXZobThROWtXbFMy?=
 =?utf-8?B?ZmVLbkVtOEs3eUJuYnVuUk5CK0d6dTJXMDNBRTlubGtJd013dGlyOHJtK2lv?=
 =?utf-8?B?UG1URWdRZWU5QW9YaHB4QVphSkJLYXpGeTE0RDdsV1Z0RWMwMWlsNkE2YnlQ?=
 =?utf-8?B?ZXljcHYzUk9GbjYwOGFqb0F3RExhYURjZkIwVDROeGVZa0xhRlJmNDZXbXk5?=
 =?utf-8?B?U3NSVUhhL3BtYUVPcnpRN0lGVWdpKytMTVZoODdneGd6U3NvN2I4aUJnZFEv?=
 =?utf-8?B?SVpIR3pPVzNLYk9lVmNzdFJrQU5pd0pPbUlhd3FTREs5R3E5UXV4ZjdhWjlT?=
 =?utf-8?B?TW1ybVBxTm1GbWErY0tPMUJXbjcrZEhETmZrekxuMlBkNk1CTTJSaGNLcHl0?=
 =?utf-8?B?eGQrVzEydytrK1JDZk0vVkhVMGh4L29qKy9hcUV3dlRrODZoejRSV282eEh2?=
 =?utf-8?B?Z05heEphcngxWUJNdHp2c1NNdzJuU1pPcDNOSXc2Z1YvTnJrWTFPWXQzaFJD?=
 =?utf-8?B?T1lEcmFVZEJBeEQ5KzgvZFprMkpOTVRPSU1WVS9qc0lBR2VvS0xvWXA4emRT?=
 =?utf-8?B?S3NwUTRaMUo3UisxU0JEbWFob2JtNm4wT3lCeEpKZDBEQWp6Yjg1dzNTWTRr?=
 =?utf-8?B?WWVnOGlWNUh0NVRxL0YyUFQxN2NzckpCdjBhNERYVWlKdjZPTWRsVWR4TnNq?=
 =?utf-8?B?K29XalRwdGNBazIrVTlvVWRGRHFFeDQ2NFdwOG1SMlpVY2JTUVhiQXdGWnJ1?=
 =?utf-8?Q?W+4PC4FXvhaipqKI=3D?=
X-Exchange-RoutingPolicyChecked: koLVUIcgWlIDu9KRbRHSLsMlYXU9x8+t5OAn8D5l5YjpjCWJk4QF/uokDNVzJ4v/EBLWIPJ9t3rzT49QP4lcINVttuw2YuCk2KrFXIwNASjjvzveaEfmvRgQzrhcLdlaQZSW7eRAEgDKjXwUEALcVm/plOXq7Qd7BwVEsUPfxf1i6AahxFBFz9fJNNOTVAw9Ex1ge/Ji4RzG/r0P9mvx5JuU02QZKK02LPx4UkpaaNAAX1wDxAlw1eJPZRZwyovrsNeOY/0gLTcmq0uXbQvh+7pcyrJA+Htwh06klbmdwc+Nbb40f10niOuFluJaTJZpeTcHqgtlSIwdIDRwYPxNMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf63d1d-40c9-4986-f4c2-08df464f5700
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:11:08.8579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/apXUAoUfQxqUnq6pOsBKew1dyzUos/FNKQd/JOWzUhEd1/Zx212ruzuMNm56bN2o5pN/iTzjNkAwEk6DBFVxpRLrS3MqArjqPqjf+GErg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7739
X-OriginatorOrg: intel.com
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sebatian,

On 2026-11-19 at 12:06:59 +0100, Sebastian Brzezinka wrote:
> On Thu Nov 19, 2026 at 11:58 AM CET, Andi Shyti wrote:
> > Hi Sebastian,
> >
> >> >> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> >> >> index 09a08a91e610..bd5876da6449 100644
> >> >> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> >> >> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> >> >> @@ -36,6 +36,8 @@ __igt_reset_stolen(struct intel_gt *gt,
> >> >>  	intel_wakeref_t wakeref;
> >> >>  	enum intel_engine_id id;
> >> >>  	struct igt_spinner spin;
> >> >> +	void (*insert_page)(struct i915_address_space *vm, dma_addr_t addr,
> >> >> +			    u64 offset, unsigned int pat_index, u32 flags);
> >> >>  	long max, count;
> >> >>  	void *tmp;
> >> >>  	u32 *crc;
> >> >> @@ -90,18 +92,19 @@ __igt_reset_stolen(struct intel_gt *gt,
> >> >>  		i915_request_add(rq);
> >> >>  	}
> >> >>  
> >> >> +	insert_page = ggtt->vm.raw_insert_page ?: ggtt->vm.insert_page;
> >> > The explanation in commit message focuses on the locking itself,
> >> > so changes to insert_page calling seem unrelated. Could you
> >> > split it into another patch or, if it is required for this part
> >> > to remain here, document it above?
> >> raw_insert_page is needed because the test now calls insert_page
> >> with error_mutex held. On Cherryview and on Broxton when VT-d is on,
> >> insert_page uses stop_machine(), which can cause a lockdep warning.
> >> 
> >> Should I send v7 with this added to the commit message, or can it be
> >> included during the merge?
> >
> > no need! Please reply to this email with the new commit message.
> >
> > Thanks,
> > Andi
> drm/i915/selftests: take error_mutex in stolen reset test
> 
> The stolen reset test reads and writes stolen pages through the ggtt
> error_capture slot, but it does not take ggtt->error_mutex. The DEBUG_GEM
> poisoning of stolen pages, which runs from the object free worker, and
> the GPU error capture use the same slot, and both take that mutex.
> 
> So the free worker can change the slot while the test is using it, and
> part of its poison ends up in the page under test. The page then looks
> partly like STACK_MAGIC and partly like POISON_INUSE/POISON_FREE, and the
> test wrongly reports that the GPU reset modified stolen memory.
> 
> Take ggtt->error_mutex, nested inside stolen_lock, around each sampling
> loop. Don't hold it across the reset, as the GuC CT worker can take it
> from the error capture path while the reset flushes that worker.
> 
> Use raw_insert_page when available, as i915_vma_coredump_create() does.
> On Cherryview and on Broxton when VT-d is on, insert_page uses
> stop_machine(), which can cause a lockdep warning when called with
> error_mutex held.
> 

I would do s/insert_page/ggtt->vm.insert_page in this paragraph only to
make it clear you're talking about the actual function, not the local
variable pointer.

Not a blocker though.

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks!
Krzysztof

> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> 
> -- 
> Best regards,
> Sebastian
> 
