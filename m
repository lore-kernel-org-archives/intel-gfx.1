Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED7E606A31A
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EZ+8dsZU;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ccCN57oi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC7210ED77;
	Mon, 23 Nov 2026 12:03:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE4310ED77
 for <intel-gfx@lists.freedesktop.org>; Mon, 23 Nov 2026 12:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795435379; x=1826971379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NW+tTgdxdFzA5Yq9KZMtAhYiSRKiP861MLBhFVqA4N8=;
 b=EZ+8dsZUvW1RN7Qy7Ty2mIxp9m0FoXHM5K0qDcaX/poHPAp5pz6pZd8p
 xNSpnOqjkyOZGR3fscTdYnlxeZQQ6hRaO7DH3qgGgZy7FfIW6vR3jNf2b
 Jhxt7NamElaE55kLzwZqJQ7og1cX6TT1Jz9RxmnhawJLKF2cNFHH1wq6A
 pjwSNLDfDix/m7QzgnHmK91qS0C0BdZ39nErTg0x4LKCg1f+46l2OKQ9b
 TTQtZuKWdQoTKgio8It0ZsV6UFbg7IqT14GtdAm4jlghZSNlP2aet3/ju
 f8Kg+XZbY1ngTRKofg5cyfsfsjB6g53e045G06XLFL/jxvtZ5Qn/Q4Db6 w==;
X-CSE-ConnectionGUID: dPPPChlfSneKWtMAW2wGxQ==
X-CSE-MsgGUID: 3cFNF4gNTL27aR8MoeC9IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4221400"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4221400"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 04:02:24 -0800
X-CSE-ConnectionGUID: DmjkSxuWSXe3LL9lUnNVmQ==
X-CSE-MsgGUID: qBSHnKScQVeqoUgGkQE1MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11701201"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 04:02:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 04:02:23 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 04:02:23 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 04:02:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLHRpRmx4sDKYeGPzbGMRg6PrxQV/PA8nIcbpfrlcFpgcBt/kL5dtHe7eqLNKh0pq4zUC/+ih0/75ZOiLnax2sgWN9YdTCC+zXkOsI/YBnezSIOGLVYKBSbaOiHrip0kbqh+kzzdvOthExJO1r7i2EwzKpOPJmu4uIZG3jRIqEB9wHTafw/C6PtD9/LYEVsp1RMhROLK6XNZ1QL8RywunzkazxXNPKnjxZBVVrTsSAO7+iqVLk6S9c4dBUBKiwyY6mrxojZ0u4eab1BvIUWN113ACma2Lq2xkEGoab7j7lFUxsA3/cv3WK7qFcaY5ihBlZ7ziLAUjKSjSl9fCQev7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEht131P/EqdKdtRq47THuURY1p4NOiAiDXVLzx254g=;
 b=tvuBTa8W87aH0ZwRhYtNwwdJR1nSeq1syq8F1+PKWnJbtFBAYIw6fxkPhRqH+uRwBbZHHrvmjgAqR0qkNBRYWWUL0Pf5qhfyWpkPPt4Mzq1aTW1enTMVZjO+DDLSaZL13+iQgJT+ob9s+UIKUX/sBD0h22QmltTvVzkV9/qsNMqLwDfoArMJ2QiulyGOq8sXuXT8Bpmv5DcO9xO+Nbv4QXYzChZWTc5euPsCyQQBYIxTIUIQTRu/DAkUwe9EtQjmoCR/k0WfsLI2o9zvhfJhYLj7R/YfFMsDet4YmlhaJpx/8d2gkj95bQ/IYwYQdtvHHdzcNeIQ7VKpKWdSlVx94w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEht131P/EqdKdtRq47THuURY1p4NOiAiDXVLzx254g=;
 b=ccCN57oi8HsfGcjzFIOgktnoxiDpe8OijqM2m7zg/jzNL74R/7KnXAqkg3YjNX+toyWtuBNSS8hVQ3/YM/sUKSPvn1xKc+y7AAdOzbb2IYeAjN/RsNDBtNxEjSY3bgHIF4f+HN6EMEQXjGkbf/1To5p1hOaS5k2Mi9Oe7prvlXk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 12:02:08 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Mon, 23 Nov 2026
 12:02:08 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH v2 2/2] drm/i915/query: Use __counted_by() to annotate
 flexible arrays
Date: Mon, 23 Nov 2026 12:01:37 +0000
Message-Id: <20261123120137.3460155-3-krzysztof.karas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123120137.3460155-1-krzysztof.karas@intel.com>
References: <20261123120137.3460155-1-krzysztof.karas@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL0P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::18) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|SA1PR11MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d8f2e3-7262-45c1-b4e8-08df495998fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|261028144727099003|5023799004|11063799006|260925021311599003|260925021911599003|260925022911599003|56012099006|261021133027099003|261021121427099003|261021123027099003|261021135927099003|261021130227099003|261022115727099003|261022113327099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261009223027099003|261026135527099003|261026130827099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: YQUND033DbXvKg51FICVa4qUgH+zBgHV//Erwy1MRkaV8wLrE89bhfHtzEYokPXnuMZYkP2yUhVfP+f8CHC3ezfwavQ3alr6AprWFOg3ouIpw6F2+yxMjyHfsLh4b6hEZpgAg8O8iAXqL3B1951kQKcp2ZTy7HqRiWv2wCA7Zqh01X0TOjrhCrDRkaepcLCbPgbvbl9JYHg/LjDf7mo1uX/u9Isnf4z/EI8qF8uAybGe1Xzkn1B1/DKFJN2eZqAt0+WYDiYxcT3RJl4QmUZjbxnLHYAaE6llc68wjHnIKz+sn07meHBRl/ZJnfW+79q8epbOm+mReBdudqm3Ug43JUY+JMzt9ONF55XVkEc8aNR+yW7bNcmIMIoMOUyDiuEkqvIO3vryvvnho7P8g7a/JAY6CIXDFLXBCmpWbaxm0gJvO+k4due9xx3MnXlV0b2dingiHzIpEBzynuKyITg0KLgQNZ/B7PUL55n8Vkd+63oamL9nF7E+Njn5k+WD0GmlSDE5djxLlPZQGCyaKx2iz+520AnNd+NL0zx8nZ0fcPMohITYuRYVMdhvnovzIV+Px7VuUxb/IyRTRKZa+WDlczklJ53TnxVhuEQOsPV8sYQwoCMCJfckYFsqHK/a10JDAIJh6E6rAfJHwhGiFuxCceAWrXAuzxX+ErnzEv31meo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(261028144727099003)(5023799004)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(261021133027099003)(261021121427099003)(261021123027099003)(261021135927099003)(261021130227099003)(261022115727099003)(261022113327099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026135527099003)(261026130827099003)(261102123227099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MCEtqdYVoVQBRxKPkAEMsnJleaKy85zupYLCpQLuxMAeVd7flhUOMmd9DWxp?=
 =?us-ascii?Q?zFUYyOSWNKGvLdi3MjwcEFvcCpQaK97tK9fX051oNdeyme8KL/5HfL31q5uo?=
 =?us-ascii?Q?xaHLXRqOmhZaw7Q7vncrpV91B6nY7UzorlKN/NqzmICzWj1/BdJo6yQJ3oip?=
 =?us-ascii?Q?2NjZGjbLEhlhRAZku3k/EMdok/PlttwS2qfV7Iy6WB7y+LFyES+DI/WcNYkj?=
 =?us-ascii?Q?YKtr8KBo+TgUgnYnKIBwx+5bMWOdBBPQhAeVz6GdwGKJQ2Vx8Go2VLdwYOtO?=
 =?us-ascii?Q?nulqrsxoCcxr0LtTtBWgeTevkRvVZGUux9aU94UEcdnRGINB6RowfxsfZNsI?=
 =?us-ascii?Q?rsDNz/AQPBw2CfJfqJ49fmxttGGHubznfzHgrkxcCqXBf1JRgBWkRdYAk3We?=
 =?us-ascii?Q?qE7CFyNkp2XQN/Z/Hs0vMBcA8rY2jXKoJauM0CxLSdgsM7JhibkkraVfBIc0?=
 =?us-ascii?Q?Mti1vRKPIhZshoJ/ZoFsu/FjhL7MFgaNO4UWi9C/MO4uF+I50RpmClDmNsza?=
 =?us-ascii?Q?+VPQH4KCezjx++09/59YZ1TPSeS2mi8AptFC9ddFXLizf8DT45QGpW+b7Ucp?=
 =?us-ascii?Q?5k5EUSXOC5qWGrf8vCRYXqWYwBG3DWKx9EOEIrWsGc3hyg4010bIUoyO8aKa?=
 =?us-ascii?Q?a+oF2JRpG3v0i8frXrTe137js98Gu/CsPHrZh+Nj63Mu6yoRPtvrgHgmCAtL?=
 =?us-ascii?Q?cpq5bpcegZq1WpT9QwyywK1q85UnnuJYNsuvM0cN++9i/Th3JHxDpAZCy0pW?=
 =?us-ascii?Q?vNcR6Vocd6yG4Juc5Vu3roOcZNv09LmON8sj12enjIDvQ1oDSex8SOhvlLef?=
 =?us-ascii?Q?x/lFiuqy/gBZB3BG8cQYZxSCHrSxIoZeG8GSPd6HHolfdtu5KiyGtFvjZ3u6?=
 =?us-ascii?Q?c8CBtxl7YuBtmQOs61lJCqLOm96P7TpOPdu9ETT/7CAFq6pvhDFe7XRsfL8o?=
 =?us-ascii?Q?19lkhsc4pmOonLHDb0FsludjPv1hpkNa4Mv0uxEJjE+5F7QkzGwbx1BNEDJW?=
 =?us-ascii?Q?QxxCXDfyAXg32/gn14+ENTQBkUFrPJFZI3Q2FMX2J2+M2HXysTnXf6aN6kfO?=
 =?us-ascii?Q?GbG2uIt8gMeIsSbjhPhtHe47C/vwvUI5wPXYZhR1vpYtnAJt+VMOORR7iK2Z?=
 =?us-ascii?Q?Q/gxpZ9e/o2rOyJ7tboaqWEIM+w3YY5SSw+zk1mAqOI0etS3c7poeRpAMKL4?=
 =?us-ascii?Q?sCaayQ0sLHEWPaVWABbHgWfvFqnvY6PHM6UCCFKl1O3+b8SACqosNMHeYc8Z?=
 =?us-ascii?Q?HzsKIk3VqWnLX8x11PUM3ozV3BgG8JPmCZr58zsgkL9Oh0TQPiWSE3JsDqOj?=
 =?us-ascii?Q?tCCSwSkLGfBmaqf1gksmHIRXClmqP01GcGBpohGbWpld9FZ/sq1kDTpeO0ng?=
 =?us-ascii?Q?w0d/rA6Gha4mwiCaPFYHH1P6Li5Owp0vgleTAO5aSgVtDhXXfYamWVu1C1A7?=
 =?us-ascii?Q?nYJVgtMOuEi0QpparkvxMVqoPy7ROrkU1/Sc1QnWFkie/nTh2g0/YBEocdBN?=
 =?us-ascii?Q?jTW2vxeqJT49rFCggmMP4e2Wyo1fUOS8Rk9jADM7+vvHxQRaw0896JyIrlic?=
 =?us-ascii?Q?5v7KgZgXOO/OK5e78qzuHygOHKDsaSw6KmXoPEQS/CYCnGgF7PI1KV4CiZb3?=
 =?us-ascii?Q?QDklE/aofjhi3BfCiQ706sEmCdcqkEXSHUy8yM39vnY8ItlfgMwFGl38I8YO?=
 =?us-ascii?Q?zTaWSkyYLKqcR/ldSMGeAEwgFhq/jrw6uCotc8mwYuqxRxbyvm9ljXZiosTp?=
 =?us-ascii?Q?zGKDDFoyYgbwZQyW5S0bFEHjjEp1pGc=3D?=
X-Exchange-RoutingPolicyChecked: RhhP1dRyvucLgidbQJ6/3XaUVRAEMe0UqmptFBe/t/xpGB/PD+z94B4bMp3wvKMrgMbhVKLr98UZ5mKba4CDTORpe7/Q+Q9L5MZzz3Cplok45FOmpj9w0qKdueGrGdHZwYFEAPUTZjSMW09bFZwKS0AxNKKAHrhNmGXdfVLYuXeMryXIimTjM8WJWQ0yJJjBrnjMr2Ot4wZ6CbUnpGM7XRMGoZl+bP02r4H1Tmk6mEO2td9SbmcSmeE5U6sMThEvemwaKJrKbY/uDHL2q7/dRCMW6qjZWXMX5DHFH6ZxbqiIR74ZAdAwSNeWEa24/Tx7guAewfCMgesY4R4BsNkjfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d8f2e3-7262-45c1-b4e8-08df495998fb
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 12:02:07.8796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 316lgFUJhJOdilIxb3qzTKvICOYwkRbncXVr9vu9RHkTi/18yINmzWR3/V/LjtO+vwUogBD5Zmkzc+mHDNqsa+oIyTzSKCM57NASYpQpWEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5900
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Annotate flexible array members to facilitate bounds-checking
coverage (memcpy() - CONFIG_FORTIFY_SOURCE) and enable
array-bounds sanitizer (CONFIG_UBSAN_BOUNDS).
Use temporary buffers to allow compiler bound instrumentation.

Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 drivers/gpu/drm/i915/i915_query.c | 102 ++++++++++++++++--------------
 include/uapi/drm/i915_drm.h       |   9 ++-
 2 files changed, 61 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 11157fb14db31..8a0f237b6442f 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -132,12 +132,11 @@ query_engine_info(struct drm_i915_private *i915,
 {
 	struct drm_i915_query_engine_info __user *query_ptr =
 				u64_to_user_ptr(query_item->data_ptr);
-	struct drm_i915_engine_info __user *info_ptr;
-	struct drm_i915_query_engine_info query;
-	struct drm_i915_engine_info info = { };
+	struct drm_i915_query_engine_info *query;
+	struct drm_i915_query_engine_info hdr;
 	unsigned int num_uabi_engines = 0;
 	struct intel_engine_cs *engine;
-	int len, ret;
+	int len, ret, n = 0;
 
 	if (query_item->flags)
 		return -EINVAL;
@@ -145,35 +144,37 @@ query_engine_info(struct drm_i915_private *i915,
 	for_each_uabi_engine(engine, i915)
 		num_uabi_engines++;
 
-	len = struct_size(query_ptr, engines, num_uabi_engines);
+	len = struct_size(query, engines, num_uabi_engines);
 
-	ret = copy_query_item(&query, sizeof(query), len, query_item);
+	ret = copy_query_item(&hdr, sizeof(hdr), len, query_item);
 	if (ret != 0)
 		return ret;
 
-	if (query.num_engines || query.rsvd[0] || query.rsvd[1] ||
-	    query.rsvd[2])
+	if (hdr.num_engines || hdr.rsvd[0] || hdr.rsvd[1] || hdr.rsvd[2])
 		return -EINVAL;
 
-	info_ptr = &query_ptr->engines[0];
+	query = kzalloc_flex(*query, engines, num_uabi_engines);
+	if (!query)
+		return -ENOMEM;
 
-	for_each_uabi_engine(engine, i915) {
-		info.engine.engine_class = engine->uabi_class;
-		info.engine.engine_instance = engine->uabi_instance;
-		info.flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;
-		info.capabilities = engine->uabi_capabilities;
-		info.logical_instance = ilog2(engine->logical_mask);
+	query->num_engines = num_uabi_engines;
 
-		if (copy_to_user(info_ptr, &info, sizeof(info)))
-			return -EFAULT;
+	for_each_uabi_engine(engine, i915) {
+		struct drm_i915_engine_info *info = &query->engines[n++];
 
-		query.num_engines++;
-		info_ptr++;
+		info->engine.engine_class = engine->uabi_class;
+		info->engine.engine_instance = engine->uabi_instance;
+		info->flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;
+		info->capabilities = engine->uabi_capabilities;
+		info->logical_instance = ilog2(engine->logical_mask);
 	}
 
-	if (copy_to_user(query_ptr, &query, sizeof(query)))
+	if (copy_to_user(query_ptr, query, len)) {
+		kfree(query);
 		return -EFAULT;
+	}
 
+	kfree(query);
 	return len;
 }
 
@@ -466,70 +467,75 @@ static int query_memregion_info(struct drm_i915_private *i915,
 {
 	struct drm_i915_query_memory_regions __user *query_ptr =
 		u64_to_user_ptr(query_item->data_ptr);
-	struct drm_i915_memory_region_info __user *info_ptr =
-		&query_ptr->regions[0];
-	struct drm_i915_memory_region_info info = { };
-	struct drm_i915_query_memory_regions query;
+	struct drm_i915_query_memory_regions *query;
+	struct drm_i915_query_memory_regions hdr;
 	struct intel_memory_region *mr;
+	unsigned int num_regions = 0;
+	int ret, id, i, n = 0;
 	u32 total_length;
-	int ret, id, i;
 
 	if (query_item->flags != 0)
 		return -EINVAL;
 
-	total_length = sizeof(query);
 	for_each_memory_region(mr, i915, id) {
 		if (mr->private)
 			continue;
 
-		total_length += sizeof(info);
+		num_regions++;
 	}
+	total_length = struct_size(query, regions, num_regions);
 
-	ret = copy_query_item(&query, sizeof(query), total_length, query_item);
+	ret = copy_query_item(&hdr, sizeof(hdr), total_length, query_item);
 	if (ret != 0)
 		return ret;
 
-	if (query.num_regions)
+	if (hdr.num_regions)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(query.rsvd); i++) {
-		if (query.rsvd[i])
+	for (i = 0; i < ARRAY_SIZE(hdr.rsvd); i++) {
+		if (hdr.rsvd[i])
 			return -EINVAL;
 	}
 
+	query = kzalloc_flex(*query, regions, num_regions);
+	if (!query)
+		return -ENOMEM;
+
+	query->num_regions = num_regions;
+
 	for_each_memory_region(mr, i915, id) {
+		struct drm_i915_memory_region_info *info;
+
 		if (mr->private)
 			continue;
 
-		info.region.memory_class = mr->type;
-		info.region.memory_instance = mr->instance;
-		info.probed_size = mr->total;
+		info = &query->regions[n++];
+		info->region.memory_class = mr->type;
+		info->region.memory_instance = mr->instance;
+		info->probed_size = mr->total;
 
 		if (mr->type == INTEL_MEMORY_LOCAL)
-			info.probed_cpu_visible_size = resource_size(&mr->io);
+			info->probed_cpu_visible_size = resource_size(&mr->io);
 		else
-			info.probed_cpu_visible_size = mr->total;
+			info->probed_cpu_visible_size = mr->total;
 
 		if (perfmon_capable()) {
 			intel_memory_region_avail(mr,
-						  &info.unallocated_size,
-						  &info.unallocated_cpu_visible_size);
+						  &info->unallocated_size,
+						  &info->unallocated_cpu_visible_size);
 		} else {
-			info.unallocated_size = info.probed_size;
-			info.unallocated_cpu_visible_size =
-				info.probed_cpu_visible_size;
+			info->unallocated_size = info->probed_size;
+			info->unallocated_cpu_visible_size =
+				info->probed_cpu_visible_size;
 		}
-
-		if (__copy_to_user(info_ptr, &info, sizeof(info)))
-			return -EFAULT;
-
-		query.num_regions++;
-		info_ptr++;
 	}
 
-	if (__copy_to_user(query_ptr, &query, sizeof(query)))
+	if (copy_to_user(query_ptr, query, total_length)) {
+		kfree(query);
 		return -EFAULT;
+	}
 
+	kfree(query);
 	return total_length;
 }
 
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 535cb68fdb5c4..e9b7076640736 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -29,6 +29,11 @@
 
 #include "drm.h"
 
+/* Non-Linux builds of drm.h do not pull in linux/stddef.h. */
+#ifndef __counted_by
+#define __counted_by(m)
+#endif
+
 #if defined(__cplusplus)
 extern "C" {
 #endif
@@ -3381,7 +3386,7 @@ struct drm_i915_query_engine_info {
 	__u32 rsvd[3];
 
 	/** @engines: Marker for drm_i915_engine_info structures. */
-	struct drm_i915_engine_info engines[];
+	struct drm_i915_engine_info engines[] __counted_by(num_engines);
 };
 
 /**
@@ -3617,7 +3622,7 @@ struct drm_i915_query_memory_regions {
 	__u32 rsvd[3];
 
 	/** @regions: Info about each supported region */
-	struct drm_i915_memory_region_info regions[];
+	struct drm_i915_memory_region_info regions[] __counted_by(num_regions);
 };
 
 /**
-- 
2.34.1

