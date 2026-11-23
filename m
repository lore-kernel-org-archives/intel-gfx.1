Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85505606A31A
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YQSqhKHZ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=bsE/tRm/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236F810ED8E;
	Mon, 23 Nov 2026 12:04:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B2B10ED8E
 for <intel-gfx@lists.freedesktop.org>; Mon, 23 Nov 2026 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795435442; x=1826971442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JgBHG//Yv86Jq7NgRq6vcLAmWD439corXTLWbq2t+FM=;
 b=YQSqhKHZds1rTS0agzKXVEryN2VdfnIMVrjK+5NdAag6zDF+horjz052
 RE27NFPJMcm6V49NdLlcg0j4/41Dt+xb92KOzrKkAjKrNZTW25MzssFRf
 szfyaotJ+X9k4ekIodChMVXMtFJJiMwe+UfEctfJB4ggMaNSUNx4DALJm
 4VSASR66iMFJfAbLcqzX/FMzk4XYv7GfcFQ2/eqPtf7FyOgtCWp4Ksz6Y
 jFmMI9TUy6an1HJwPqxZdsLGk0Oah/cnjO+4PC736x/rBh1oXYirv0kZC
 Lsvb9I0vu7LfpTkOKRfMVwGuMpJFeTeBDZ/hFVd5fxdL8DxyJpDg2e+VT w==;
X-CSE-ConnectionGUID: QtzUBz10TGO5ONRwGq5cbg==
X-CSE-MsgGUID: Wo3WzZDBQSSE6ESpwjrPxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4131613"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4131613"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 04:02:23 -0800
X-CSE-ConnectionGUID: +SOFZKZNQwCMtgXZOwQN7A==
X-CSE-MsgGUID: VfllqAA/RAK6f5njO87GaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11181558"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 04:02:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 04:02:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 04:02:21 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 04:02:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2R878x2bmMRNFVSGnNAS1aTbhJ+nziw8KRcaxHAGYPy/KJrTay/CZA3nUUU6SNEyYXgBeLoj/zeiQDQI8boWTxTh8Rc3GpAeQD2lI+ez7vJkqynOfSZdiHGUXsk0vAMK8mi+DCZACc63KGuewQ85zC/II9pr3L8ympsqocrr8b0Si4pd0Vxf/pHdLmBKonvnus0LrBKKwZDM2piKJV3e/Uwkl5efgopeZweCRi+EBSZdK1b5p6Iahsm7noIAZIfxC6cj/fj69o0VH171HWhp6a1bsoJ90ihEwqjPEHMaXdli9rsWYATugo3x1wUBiRzyicqX2Y0/TcC8vAKrIJH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EJT99hkxoX3LTystXvBwvnz1lEPtHg3RkNt02bwnnE=;
 b=jSGVy6y4plhkoczjnhjXBbaz2qmVFJ3i/6Yb7tXZcdWuoXBKTKBpaIOh5Ncql6LeeBTYUrdcStMbpqAN9ycSnhx1I/tba2AY2773iYbwa0+nTtsk+g2QI0pKxqY65uvVFOba4FcHDLUdy6YhcXGYIU4i01EVLqqKvw50830fz+cW9rssk+sUwCe7vOh97uPp6ILBl0dOEBJxo3jvSeUm9XxUdi07LG7TQNqxh1tbEqgjCpTnKCxqonjsTj63AzPCIq+X7Uml9ceVfJz+uBen8HHiGae3tgWgmQAHWaACywP89uQ7vNZWZavS3NqD5QuUQTUQ5C5rValLzYEJRTdS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EJT99hkxoX3LTystXvBwvnz1lEPtHg3RkNt02bwnnE=;
 b=bsE/tRm/37nnbHr18eHsU7JEwouilx8SSRy75FucwzxlB1YPIuwZK8m9WrA0gz76SLSwbcVBhrkDWWss4aAZZIPju9h77mIKFSbTgwBHShHdQesKnteNlD0EarUbmG9A0K5ts75chQizHj8LX6EXKJpbLzOQhXMyxgz47tEMDb8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 12:02:05 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Mon, 23 Nov 2026
 12:02:05 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH v2 1/2] drm/i915: Annotate flexible array members that require
 minimal changes
Date: Mon, 23 Nov 2026 12:01:36 +0000
Message-Id: <20261123120137.3460155-2-krzysztof.karas@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: fb4c4589-ac56-472f-f520-08df49599789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4fSeVdcGvRd9il93K+u2PzD9GYa4T4ldTxC+6jbEArENyDkQsDplyvT8QvIRFDfZ2eL8TdT58ZylkPOVQlc8KYose4I2ZllbR57u0KShM13Qyoovq7T5bWLlFWF7Cb93iUJAnU4kMlDuS/z4onzZ/q1oxFFy+BMXbuXYWzttqcV+b1d6kWPzG4T5Mk0Etq6uQG4ukPeqdxQLhgm1lnrNAzep40YTmZzpaQ4RLnLc18YjWBjInzZPM1qsmlDWU7Uw/JPhh0X5+w7A2/WV0p3Uu740Z5EGQzMPavuPotEBizGoWdQm/EWa75vw5rsCZjhoSdGexkYM937DP4btSwsIMOgqIu9yAZMGiz9VsZ8VlLyffb60BhxIJW1rgd9LRm1+sh7cQGuGD+a7/18YusXUq8DGb6jEIoCGyyUw7FI1EFio9KFeo4qNfvwriGVFjFuIUwO0ie6H7uqRCRyw/NfAW5+GhuZp7uwNRWOOGvMupgvAtYzhmjBHEkgHqj9Usd1VAnfRMK9xvzsIiV7E4IbkjQKgIwQw9SWYa/4TXq/VOYSeHqD3IUDh1Xy+bk+nWWcSe4jfgx0CrnC+LeS6Ni4yEkTPv2ZtVZBOr3NfamwORbuZnPMLpB5btg9tZjhB/4u5Uele84u4pYSdUJ0iU016C+lhiFNXF+wJrQ0Dz6hzSyE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GMWT0j5Wi465IVh/k2vWMa3WyFrLL848D6AW6hseMla5JRJ6Ff2YRZxblpoc?=
 =?us-ascii?Q?CwWDm5Hfj+W/xGGDzd5pl9onrbWkZFm5+zmgKdzqsO5FKykK3SqJYDWGbmAC?=
 =?us-ascii?Q?f1uLMMiWGyRLN5qkFHTL9OQvekakL9D1Wx7Qj+F8ogo53fc6ruJrtjbw8RIV?=
 =?us-ascii?Q?r8ASMDTvSSNe9G52hqkb8Wcwg4lbJxR8WWj2VACy2+pbfuLQE+27hpoSGVLu?=
 =?us-ascii?Q?8017gh9NaJvA+2IF3EB4OKoSQVhFvJfylTHGEDiXV883o1iG2cUTv9+vE2TG?=
 =?us-ascii?Q?b6ydSn8zuk8ZIAlp1ksgUh8UapobpmUrzZlDKTQj0I6Obgv4R8b++gNV6QHg?=
 =?us-ascii?Q?YYoyd0suFV+LsWRb9AuNG0PdCl5BYoJ1426m9QOCB2ELjgidPSXMdMGgQKOU?=
 =?us-ascii?Q?6T83TbTslnU/CWsL5PEVjriO/Ya5xNJOFqwrch2wVYjDeSYyvuR7qspn21Ba?=
 =?us-ascii?Q?09alqpTKX2q0ppKoWm16IQKGcPCX2hFE+Q90IeGiIZZ4YQpC0NCjVFCd0AXT?=
 =?us-ascii?Q?oKWqiicXLx5I9Nejc5GjqqH8bNL8E72cZVqqVq5KTkVMTjnabExuI22xX6Nx?=
 =?us-ascii?Q?NoyDDcgg/VyysFF335hRtrJWkaKkMFhdxfv3nJxP2P3fyX8eY04QuAAcOhnv?=
 =?us-ascii?Q?zOU/rcgGnMt/oX0aIsrTW4S8qvK2ZV3ZGhcEMIYH2Yq3CqiajqdBTa2onYyP?=
 =?us-ascii?Q?AVd5QOuWjibo6JXUtVNwJe7cqLJaBaUOGT3SiTlFandw7Pfm7dKfl78GZ0BR?=
 =?us-ascii?Q?MqshYkNhi2rO/CHuc+ASqyHCa62yj/BDsVyLi/J8WJ1OYtaeifCVTzoU6Euc?=
 =?us-ascii?Q?f01X1DER1WTtOy6YYZ9BGHWSbdC7HRg8+74D/tg5UVNUuMbsFi7mSQwld/A2?=
 =?us-ascii?Q?3EyVwlM8K/ZMyqAxsTzDQ8csu5jRjGY0x6v+td06xiStSrWTY4hNZq1jGQmY?=
 =?us-ascii?Q?Ddoh8hFSVfENfTTZpXEZ/AHIF80HAtt9DND/m9EzvV3Ztv4jqDJvCh18RT5E?=
 =?us-ascii?Q?rF5xt7DIa40Mb4Lr/vIGGCXiVRJolRTctVBPApKYrvCWYMHY32m3XGqS1fEN?=
 =?us-ascii?Q?/h4SEMb6V6Ge+fRD7cUe9H8GmGmj+me6JvPV26PQ1WjU0otaXBfY3ST5TbLk?=
 =?us-ascii?Q?y42KqnAcegTLJOlNZ1yuTFAX+fuTlN4ppwfT0DeRkPB9ownejJLOcUwMB3Up?=
 =?us-ascii?Q?DbH/+G/YZhgnHRKF8VG5dus+IVl44Hp6iNGxQjsxhMS6buJ1mbS+8/FHkWJJ?=
 =?us-ascii?Q?NWZ4nAOQ2CCn7d0Tngce40W0SFiueR9HZ8BDBzXIvDqG5A8y0G2HQb10+YYT?=
 =?us-ascii?Q?U+MusJ1T0ySuwYlOTzI4jsx6zOEauukc5Ui0hcCvaNadr/4HJSlkoaM1ln4H?=
 =?us-ascii?Q?QczgGHhx1fm0WZPwyEp6dSJvQGVaOTfoI9ymZ2AW4yh3bXZIyZW4tL/s1ulM?=
 =?us-ascii?Q?GkvmTlIJUjijHxWZng0tulpSxswfyB/dJpGIVvw7hR21rnVjyc8rsHurykw7?=
 =?us-ascii?Q?D+k+01TkE4UX9eZ3MDUPRjPfQwjOXW1VbmZ5rdl8j/E4Z7TMsg9XxszM+V2G?=
 =?us-ascii?Q?8Y+Q+z17KKW0uU2j2erK16mkrA45ZhPz7ZzLgMsYh1nVncz8QJF18CQtxhBo?=
 =?us-ascii?Q?FHEZQG3/XA5g3CJ3EodbB4rtACr7r0i1+VI/fCfvYzUh4kWeXDc0bFvJrZ43?=
 =?us-ascii?Q?gxr8QqX7XLcnx78E+FsIuKFA8J8EvvvIqli5vmw72dB+1gxop5ycx3dIdFMn?=
 =?us-ascii?Q?dbTHd8R6PxRN6sRVaJ9a1Zwi5f1r2nA=3D?=
X-Exchange-RoutingPolicyChecked: UQE7tnlHpF59s9iB3OCYA/xg5X7z4kVjYeFitpUbuw3BMw0rM/dAm98W2Jg3S7NrWIGy1TsBUCU4gKdVa3hr3AkqWOaIDxDqqcmXUx8Sa82091bWd+d5yKoHjZ0rqii7ma7Z+cuLFKsbKouwa9FkdoqeCuUcprtYR/u2Tii58IvZo3TcpdYpKj7yeLUS1jPnidbomwQb0UyATgReWtNsT2Rx5vB+pMs+iF0JRGM6cxN86wPkOtlGWWmeM917zdcm8exqoRLnb1ifneRk/l92V7d26iPqbeZY4VWwKxNOmJ6Do++t3Gft6S9Y5wZuKp7fFUyWvWUsEKtAd1hyBjb3ug==
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4c4589-ac56-472f-f520-08df49599789
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 12:02:05.4618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ksd4JkwId3QuWnxWlYVAKzjliTeU4STJ+qy+XXQ1ognJ2lK/i6VWRg099UprbfAu7bfiEO1GKHUQxSn/AsG6h2xpmuGS3291ISLpXKKU4II=
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

Annotate flexible arry members with __counted_by() attribute in
GEM and GT code. Follow path of least resistance and pick the
entries that require minimal changes to the code.

Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c          | 6 ++++--
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h    | 2 +-
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h     | 2 +-
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 6 ++++--
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c58ffa5a8fa6f..2efcc5d5d5ac1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1114,6 +1114,7 @@ static struct i915_gem_engines *alloc_engines(unsigned int count)
 	if (!e)
 		return NULL;
 
+	e->num_engines = count;
 	i915_sw_fence_init(&e->fence, engines_notify);
 	return e;
 }
@@ -1124,6 +1125,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
 	const unsigned int max = I915_NUM_ENGINES;
 	struct intel_engine_cs *engine;
 	struct i915_gem_engines *e, *err;
+	unsigned int num_engines = 0;
 
 	e = alloc_engines(max);
 	if (!e)
@@ -1147,7 +1149,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
 		}
 
 		e->engines[engine->legacy_idx] = ce;
-		e->num_engines = max(e->num_engines, engine->legacy_idx + 1);
+		num_engines = max(num_engines, engine->legacy_idx + 1);
 
 		if (engine->class == RENDER_CLASS)
 			sseu = rcs_sseu;
@@ -1159,6 +1161,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
 		}
 
 	}
+	e->num_engines = num_engines;
 
 	return e;
 
@@ -1211,7 +1214,6 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
 	e = alloc_engines(num_engines);
 	if (!e)
 		return ERR_PTR(-ENOMEM);
-	e->num_engines = num_engines;
 
 	for (n = 0; n < num_engines; n++) {
 		struct intel_context *ce, *child;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 0267c924634b0..951b46ae559fc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -51,7 +51,7 @@ struct i915_gem_engines {
 	unsigned int num_engines;
 
 	/** @engines: Array of engines */
-	struct intel_context *engines[];
+	struct intel_context *engines[] __counted_by(num_engines);
 };
 
 /**
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
index 22818bbb139d5..1bee91df73ea8 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.h
@@ -11,7 +11,7 @@
 
 struct mock_dmabuf {
 	int npages;
-	struct page *pages[];
+	struct page *pages[] __counted_by(npages);
 };
 
 static inline struct mock_dmabuf *to_mock(struct dma_buf *buf)
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 841f719326756..ed3fc9b84f219 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -201,7 +201,7 @@ struct virtual_engine {
 
 	/* And finally, which physical engines this virtual engine maps onto. */
 	unsigned int num_siblings;
-	struct intel_engine_cs *siblings[];
+	struct intel_engine_cs *siblings[] __counted_by(num_siblings);
 };
 
 static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
@@ -3931,6 +3931,7 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 	if (!ve)
 		goto err;
 
+	ve->num_siblings = 0;
 	ve->base.i915 = i915;
 	ve->base.gt = siblings[0]->gt;
 	ve->base.uncore = siblings[0]->uncore;
@@ -4009,7 +4010,8 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 		GEM_BUG_ON(RB_EMPTY_NODE(&ve->nodes[sibling->id].rb));
 		RB_CLEAR_NODE(&ve->nodes[sibling->id].rb);
 
-		ve->siblings[ve->num_siblings++] = sibling;
+		ve->num_siblings++;
+		ve->siblings[ve->num_siblings - 1] = sibling;
 		ve->base.mask |= sibling->mask;
 		ve->base.logical_mask |= sibling->logical_mask;
 
-- 
2.34.1

