Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBF2606A31C
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e0tYPBrk;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=A28/zwdI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA6610FC06;
	Wed, 18 Nov 2026 13:03:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6CA10FC0C
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2026 13:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795006969; x=1826542969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/IFTfxkMajq9UR9lWrsHNBUTH4nuv5NHd6vhxeHgCf4=;
 b=e0tYPBrkwUaW85cyEmbtdraxZax51eiDcL0tWNNVKKjBgywxcOFg2k9i
 33r7Xj/9pQQKgCqrWDw4cDbeWt5JRMyzrgR/fnezGqo1KIQsWR6GCskuB
 tPdXoWi4v9UNW5gVgvrYCbOYEsGt1u1weYB4o0hl2j3ZZPyUKepR+a7pH
 oRgYxDYY2xSWY5RDJ+hdGLZTkY60v78+blqvN+2rvtHhFb1AeEUcnaiJ9
 oZe691JH1o3XAH0ZnTzR8mBV9x8r6hqApJIht6bEhyCWG/m+R/mTXVjWv
 XwZ1h1ZFrYIyjy7Pfnfb6M9mKgdXBfm2/E5gzd0efTsjVgchcu+xmZyJm Q==;
X-CSE-ConnectionGUID: 0tjQwcqARoStVt0TANT4hA==
X-CSE-MsgGUID: 7WYRQhgFRrSj7kJ8km7Z3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3893141"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3893141"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 05:02:49 -0800
X-CSE-ConnectionGUID: MmyCtEBFSHu9SWgOHd25aQ==
X-CSE-MsgGUID: kzQhIWDXTt+FOv9nPxvvUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10045512"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 05:02:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 05:02:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 05:02:47 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 05:02:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcT3gQ48Wy+NyzraquPm+x/oFYGfuauSHWyglfwgi6Y+7oxGQSC4CVITXd6URakO5RytZX6LsQpcovJrbyjG2+JK7F6565/rcI1dzonuHjv84D4FSjUh4WD7ikDg8fFCTYex1r3/FnX7jWXOfisiU6B2Pbfq9J5ulY9MbFmx3lxd/nw67B33A4gfnFyW8RzAhjrKOahQqvXAoW3EYA279RyFqK/gVx4vCM3hSdwGid4XyLiVfMNLq03854xz9wgdO7yB2BissBo5BykJGzWgY4QnDFri62wyHoFB6sKuh4QruIdMjftUG/OxQupW5uHwiyPLdm95RM9JB9vMgMw/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDJx58P//5i1kzgdFX3NXDhc95Flkg+G1BpM25sT6/o=;
 b=klreEi7ziN+ChTooujZcotxGZ1kpDV1o7iibX+YhqcqFlpVsqr/t9ml34KA9WwX6FleDoxs01HYi6FcwnrmMaDF8wc6bxb9IB2WYP3+6E5UTA8LunIneWDctZ00h8GzuHUfMEyaQPzr552zJh6Pp1yEEG2HzXGwZfMxIYDtbTr1xft5Nj6L7oxKcaWbPcIRDiBG2NQGlkz4ycp4zvO5qOKWDa5Ym39MyciXKbFH9G6IZoybtq3VITMw073yJJTvnli2rPj3M5VgdJda26xdsZ7crnoSb0vxZzCMf6dyuJZDyMouFrd04twfnBzpUPeJ8VXyaHWioMsFJ/toDff0TBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDJx58P//5i1kzgdFX3NXDhc95Flkg+G1BpM25sT6/o=;
 b=A28/zwdIbmFVlZcWIRlK5O/z6txvAYAwsYlQRb9AhmV4E9hUSCdgOoF3AzSZRg5wtcQzU4R0l2CrWU9VlzAHjAenhRP0it5jcVHzkWOBT0umVwpPd11YjVBIdghxEBTVUQVh8GGrlf0SJj/2GTDbspEkB93ISYJpYZFmIAG9kns=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by IA0PR11MB7260.namprd11.prod.outlook.com (2603:10b6:208:43b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 13:02:45 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 13:02:45 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: <andi.shyti@linux.intel.com>, <chris.p.wilson@intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.niemiec@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v6 2/3] drm/i915/selftests: Limit stolen reset test to usable
 stolen
Date: Wed, 18 Nov 2026 14:02:19 +0100
Message-ID: <d8bba118ef131fa452570776a29606d469e151b4.1795006734.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795006734.git.sebastian.brzezinka@intel.com>
References: <cover.1795006734.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR10CA0018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206::29)
 To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|IA0PR11MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f78018-af81-4235-2e4e-08df45743d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|261009223027099003|261021123027099003|261021121427099003|56012099006|10067099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2lNhF8kqBcxldtsd3Wdy4j5Xx3aLuEJ/EsEa9LMxdaGNKzyr3bF7K1FefqgOOXNRscRxDQaDVcHw6MYCDK7Ukckjv0jNhzyoz894ftmzMYtR+zxVJtAnrqpkbWQbVTvTq+y94Q3sHj6v67Z3Kz+i3zB2R+bNrGH0fNSO5/4uMT2Yi4yBmk+Dfy9ovDC1ZCWi0Mdwh2FbCu3qJ5aIrj2Cwt3To0CloluOQlYDPc8iqSp6a4ve/WMVJaWcqE+sm17CPRd4ej+mQNCD/HvNrFj8cDaSayO9HgOVTYqvoXi6IkiVKl8oIvuGkP1TTm9ViMaNLS0AWCereLtBbkiVQpNpdLc1TZv5DiiRYtPDOCX+GSYXIB8VPTYYEv2/JVwSVZqp3/Tt/MEjI6qTQ9YshUJqRScVA+nPyVufQRpZGe9o+oqL41l46bywewyuLkEQj/aT65o8Byp4lNbe9PAmz8FH9GNP2sZBmvfr8bxjV4JED0E4VbHuEZP2uFdaA02Nzk6gA62Bd1aebb0lHPS821oXODzCIY4ROYG14U8yvpwX1FOd8VZzZOxBxvOmG+AduPjV5n1lM7MwGuc3/awJlm+LLC1UMkD8Et7zOlGRhtTTxJVVN0oRWdr2lDRROdWcaxP9KRe9xdCR1fJ7yI0s9CxynsEzVr7Jlivvc1v0t32hIg8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(261009223027099003)(261021123027099003)(261021121427099003)(56012099006)(10067099003)(261102123227099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?odDESePEXfCaQgXupVbRBH8ing/nbW60uNiBU43P/hFmEj5xeRcHlAzlNmoh?=
 =?us-ascii?Q?mT6nUJcRoJl0UTAUtVQuf2Z42nNdgcWPMhPWk4X7NHwoKKcWpArJyCm8ZCAu?=
 =?us-ascii?Q?zB1z6kFOF4rR7BBbhAw2YeYeYOFsqUEgdIa7ho5w+w1gcINxSpFlH34I0DB+?=
 =?us-ascii?Q?sIo/s9++GwrL7o9JF8CY+SQhdorgm0pW3bL9FZ2OnjSxeyAthF/fCRWZwihG?=
 =?us-ascii?Q?p+I2ZRwUijWvzvs0YHRlZiALvZpBz/ax/Km+28mS+1rgzDVefJ91vM8RQlcb?=
 =?us-ascii?Q?EK3ciiPQNH5oygDip39iVbGGNk31FRd763kgC66h2QPnJk4Z49C6iPjc0kVb?=
 =?us-ascii?Q?oVfYCuQf8y2IPl2DE0wqW9DtQE56PPU/Nd1CI5fXLze+40EP4YiC+bKwWTZf?=
 =?us-ascii?Q?XgBjFZD+5iy6AeTCZu/1xkV5vcDMpZMixcfUBBla9B+7G0SLk6c0CJrgyWXU?=
 =?us-ascii?Q?FQPvtcRhct0/pkxnKLSXg6BN4F8gqTxMFPhfF+BOGdKKhwdpPdXce2GqkeLI?=
 =?us-ascii?Q?4MI+YmOIkKNhUHWWFQlyG4B/AjVjXkQGMYV4PkuI5gTobiWs1UgnIbpF/atX?=
 =?us-ascii?Q?VN+KfyuepfiQTmvMxeAkco7ft3B555GOlPm/QabUFgW/pLkSCIVlOOhJ2ypT?=
 =?us-ascii?Q?ETUCr8n3S7OWATMeen3f8XMszqYWe9CVAt+LWMpIkhsqQkCBSR93TlEyGRe/?=
 =?us-ascii?Q?Zr4j9fuN7LnrB13mLhP1hVGq8I2UC+gFTdjXx5tmOUZV6JXjC4tfZuAnsslR?=
 =?us-ascii?Q?dAaUfuOyzhdaRnE4QQEpU4bBR51mXV79sFfZ3gZmYMy2l7e3L/kIXZdI/GLr?=
 =?us-ascii?Q?Lvdg5kyiA/njnLDdAThcvvfbcDGbDsIOsKjKPeHdiaM9Xil7WDC2CO0/RNmy?=
 =?us-ascii?Q?I60bDBlkMMpAtY7WU996zdHUgx0i2t62nrBBp+wLBfZdWvmPR5Y2l1mL4+W3?=
 =?us-ascii?Q?bJLRxuG1DONDvPOxrghhCTqF+orPJePbSbeD+sVtUzaVNV+iUlRt4MjT4erv?=
 =?us-ascii?Q?feS7YdcV/eXdxDDQCELh1mj0fJ4K3JChc5CjG7ALhGpTalvGkskWSFrSWjTN?=
 =?us-ascii?Q?TTKTwRZxsCY4PMpg8+ZYAyTY3w8LGfMSozIqYZGE3RRVA1p62k8Qy10jJ1+d?=
 =?us-ascii?Q?S6ggTDOtxHO0YHG9Z/rxFC6aRtfbrkfd0rr4VYFB+fdC5XJNnslt/blSSa2H?=
 =?us-ascii?Q?F77CNzmMlMEm3BWDruTVQXWtwsb8hVDLHugHI0YTyzdiuemvHOjtnXsNAFJ/?=
 =?us-ascii?Q?9QgKIljtr0H8CxHmqRvMTRQKpb5zLjvGR/q7CizTdV6WAWSoUeqiVubJgK7X?=
 =?us-ascii?Q?pWZLj7tkPg14QsWQvKFZ9Lm7WMRazbI4kRtHvYjYaLy/eP+S2im4C+XGnhey?=
 =?us-ascii?Q?DnauEt7aYYgcf2Bx3wsQkyla15Q2Y/AU/QGX3KxCqQylU+WTX29R33Jl3SPL?=
 =?us-ascii?Q?UkexOzJGzDBbDiGcqNPXrkglf6bOJnhEL5O+MtYpKbHcnEash331a9BEINFr?=
 =?us-ascii?Q?GNRzkWMaqFyfooQxsN+ZPjB/DTdO4Se6UHcCrTA/R9gQ06y6k052dGaaOhHG?=
 =?us-ascii?Q?tgVeRk8ch+EUNBrfXLJNp8sgVDl0fb1ofbRiv+IvGJ/Xv28WGoh7WrWAlevW?=
 =?us-ascii?Q?SmKyPy3yQFtgfmRbCl21SExzHx+K9zgfaOc/3Xzn/e3GliMePm2sxq8dY8Xe?=
 =?us-ascii?Q?NWO9TtJCNdZDgD85vhV+bjpwbguGoEu7R+4sS2W6fpvghZ0qXdGrYqLKNCMU?=
 =?us-ascii?Q?E9KzGSADk3sJ6nhBObLUp5yLYlN6QSU=3D?=
X-Exchange-RoutingPolicyChecked: GZn9mLuPC+gVvmi5mjFNMp0039Jn4mkKdr+by9Mv3StdS2kaePW9rWmbiwkhGQRDYNEM0tCuGkno9FhBM68xzBRsR7/2SsMbgGKaPXsF7Ucjd7C0DR/u2TH8Arl5rNdIPoL/r9ll6SytbTwSd4hL+KR7W3zE97iW/1yr+u6+FTxwGieJiVnVRnbgR0Syb3x/526Hd8bvhKanl2lvsw6tqxRKi5uqdqjGIE7NTWchHEVrrvTLmZ0q/61Nu8AQJnk0jaOqlmztWQdGLv/GtCSd1CaR2TmqBqFr4OeQ12AYk8lury27MlvmpoGs6c/wYHCrUr0ZCnNTRbgEntmVr2eS+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f78018-af81-4235-2e4e-08df45743d1e
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 13:02:45.5976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1xDcUzQ/AxsCplSLDGKCvJLGwCwpxYgNzmOsE9JEg/Uskfo6uPxe5K54ZY7QkdB376kzAPc+N36F09SAIz2j+j/Nf2Nsyw1D+2WtAOd0nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7260
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

The test pokes every page of the DSM, but the hardware reserved region
is not part of mm.stolen and must not be written.

Only scan the usable part of stolen memory (dsm.usable_size) instead of
the whole DSM.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 7d4b0382fe19..09a08a91e610 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -44,7 +44,8 @@ __igt_reset_stolen(struct intel_gt *gt,
 	if (!drm_mm_node_allocated(&ggtt->error_capture))
 		return 0;
 
-	num_pages = resource_size(dsm) >> PAGE_SHIFT;
+	num_pages = min_t(resource_size_t, resource_size(dsm),
+			  gt->i915->dsm.usable_size) >> PAGE_SHIFT;
 	if (!num_pages)
 		return 0;
 
-- 
2.56.1

