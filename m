Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56717606A33F
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2026 11:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q97Lw2Ww;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=mb+dQmbt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E325011204F;
	Thu, 12 Nov 2026 11:59:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B16011204F
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2026 11:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794484777; x=1826020777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3nPVH45c+texSNwH46jHXGbbmf2T5T9kxRR7nIJUw7o=;
 b=Q97Lw2Ww4dASNvPGYCUMjAjBDmfDAvXzutszzrydGwf5dgoxwAnk0EVW
 nSau/RVP6ysbBt0xupI1KOzonTvJn3Hzv5C+6e/+SFitw5vsYKKZ1fBlO
 +hgMziRh84jJspAD/7No0855nNkiHnHazDEC2QyAv1Ne+Zq5owDGm8XDt
 xIyS0ovr2MmhDZwpmOckymVHUmuZ3PaRyl0iQKOeZmW4h0+EjIOGtMOBO
 htVXfDdHzH4JrKfdaXNkvLWauubZqHaTxnWGI2Zmw5RDALQPZsFEmviff
 WlSklnlu/+MpbJzrcABeRUe1mw+DJiivpUoasTAHwDNkjZ8K4PSzY/cP3 Q==;
X-CSE-ConnectionGUID: Ws6lizPuSz+hcVIBEIt8Aw==
X-CSE-MsgGUID: BIhzPwijStGOJQuzOoDBZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3178067"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3178067"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:59:26 -0800
X-CSE-ConnectionGUID: nVGTKqQ9SeujOgKk/CrOGg==
X-CSE-MsgGUID: YLptWUWJTSutgIs5bmTCmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; d="scan'208";a="10538108"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:59:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:59:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 03:59:24 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.39)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:59:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IevdFGf8qg7kVDRb9YY5M/uiXE0Z8L/QB6NMaZ9GT9P07HLH0bXq46og2IHuyvXxfTe78eyKhYgoB2Fwm2njRoLM/IcuVVVeAqz8k1LuqsIc9kjWQCkMVQRjXZ1Er/qZxwVlvGbupcikTlLzk27Sj9PUq9WT0FTfquX3g3d+lID0QCV2vfZ7Kcai11cys38bScKXyZ9xFvK26Gdga4UofA5IzGEqgpBKPmEoPk0mfsESIaC++nKHA55MpNyc0ozsqXNvw3yxX1eMgVmyw7O2SBD1sZ6dobVFeNQT4cSnKfPa2wLOlczKMUDeiDM+1K7mX4uedeHeTJAIWODKGQVxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VClpX+LRkTVyoQBKfw3Q+QeTvvlI2Ke/ook/dVHSVno=;
 b=V9WbNvzxvXVN8fE7xhZ2YvnQBP9QUUyUCR+3+Lsw+JBpM+pQZFOT6gCjvwGfS6MIozeUSi5ZC095NNS0h/qGPiJHJiAvI7P/vJD3sz+QGoPHjA4gKrFxoWj5Gge+Ry5qakYYpBDsKGo0zasur3nqmlOh20P6lw6s6aUmQzR9ChhVjtyxMLgVGUJ7nHV+y2D2V2udhXpYDXSdyZH1jteaXiSH6Xs+zNsQkKhBIwi2jeXVhhMjjxpiKbDJFMsgwAaEXUxo7L+vsHbJ32rxUKr1plEUTiQdz8DkbSsVhrUMPzf55p8BPsbGRIt+jt0Jtnj87xOVmbWQLB2z1fUuuYirIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VClpX+LRkTVyoQBKfw3Q+QeTvvlI2Ke/ook/dVHSVno=;
 b=mb+dQmbtYeUm1tSvAMmXQ5kob5sBhEZOQZK6abCHL8o7rVGsmpiYkAlKalbQiz6mgBiAHV49mA32Sow7apBSYerLWhd3aNURmuZw9jonRLl20M5FHcYZHEELphpbdyIQ/Lpj1/2z4KwOl6hRuZlqVqNru3Rn4EwkBGjD81Ru5Rk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 11:59:22 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 11:59:22 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: <andi.shyti@linux.intel.com>, <chris.p.wilson@intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.niemiec@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v5 2/2] drm/i915/selftests: take error_mutex in stolen reset
 test
Date: Thu, 12 Nov 2026 12:59:07 +0100
Message-ID: <20261112115907.16263-3-sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112115907.16263-1-sebastian.brzezinka@intel.com>
References: <20261112115907.16263-1-sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0033.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::13) To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|DM6PR11MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d28dfa-2cf0-4e83-a642-08df40b463e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|18002099003|22082099003|261009223027099003|261102123227099003|261022115727099003|261021121427099003|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: GJ+cfcmLxGXAFyodhh0tij86t8Hw1mR3e/7c81IM5Gp0OVxTdEC6kc8nJ7HnbYBHQw1dCRxoQoLUPhix65nIneE5Lkd8gcDjLO2lK1LART0hKNLNuxDTmB81rQlMOyQn0942Wj12GPXgYuvu1CBtvlbw6MN5EHQqrEbN08TUiD55ubO3lslT06FIJEIToCSEK98aawE6T0YuhKkfStylUDyA7nKgi7QLEFccvXxqnCt4IzJXkOK7I1Qwyyl6NP4bBAI8gGVhobHYK0truyx71VO83/VcznHGROk9/S/z4OBSCa6FKaAuZ3uRp8NsKPWwL8W592XJSWKpZGrNKZlDrbekbxLG4FKDwl5WYhnp69XKrNiUu0eHv8+P81YngJaYXuBTUKlHDTuldBLLmwH9ZRzpAlhMUNf+3FCUbdjCVrZMI/5vWhUV3MS2RD8pbV9CGkO2Hiy66ZGTBZ7KhBlM9hhBylniQ6bIRcpt3a1amxeYYGYrkrG9c+7V7Mfnp63fqypxTl5qY2+wlTJ/Nl3K2Tqqb/MPuLhWnWs36BfcOjmr9VFBFbsT6AhpEmTiVXwlUePdKjKrWKzwrpM6TmVdZeu3AoH57fpbXpt1ZT9qYI4yTaq59tFPxzVv+mOEAC0uTSR7Q8byl+4f8cD64tEV6ucQVZtaRZPaVms44lzr01A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(18002099003)(22082099003)(261009223027099003)(261102123227099003)(261022115727099003)(261021121427099003)(10067099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?esWzvmdn4xCHHii8RJgGVbxkJ4SaL1dvker6xvShOgPnKRspNQRzNzgHtdqz?=
 =?us-ascii?Q?j0o7QhZ4UuNJp0gJt/vVth7OdEU9+u8S6quSjso5bp/5eUDaq5U3jdpFiQOE?=
 =?us-ascii?Q?xve1EhTc5VU/TdXs1vJJBsyROat1ShOZ4+8cyGy2QXV8vAk8k2LmrVMVlHey?=
 =?us-ascii?Q?Ghlf3JEjmapUfPD21YsNPaolkw5HYqtYEZ1+dHqInAzcNLEZjw0QYMHtWp9J?=
 =?us-ascii?Q?vQ1RbJBcVJcT+yT+CE6ePl3YNd5vYOaZmOyGzGzZWToc/i+QC8xZTxviuC4O?=
 =?us-ascii?Q?mC0sbUtl57ZOPHowWeDISwuEuAj4jqyr7Rdnos8XExPzJDHrcLoib1NnJlp+?=
 =?us-ascii?Q?gpxRmzmIMVGH6dEkq8eJSeecmtPRm78Y+Oi3AQlXmHgLN9kmQwyOq9Xsqcph?=
 =?us-ascii?Q?ZUNnCLAM6UdxVZXKaUSCNv+UI4h+Lolk4qqA5legJEJmNxdbmxADzWUXyTLI?=
 =?us-ascii?Q?bYCRcbCCHqMWOavD4DqLvqYo2/+Wva2FBpv5L0eNY58exjYpaMMMqumcyfeu?=
 =?us-ascii?Q?ML4QQ5MdvxnZUZ/sQlaFdukK2S9fNMhysOdt98tsmCUtzoOO5NHVG2eWUPM2?=
 =?us-ascii?Q?0qxx/iFJbUC1sSSou6CgzW+vAwc2gpfeQ96FOI0G7B8JQcK/TVeX5rqWBOQr?=
 =?us-ascii?Q?jcEa0W8curCwA9XRWBiP3znm/PjyQGZgMaLzOigpHlkBcZGUlNNUG2xyprOt?=
 =?us-ascii?Q?ijXOvT1bkO7RsUsG7iDrXK72S2Ek9dHA+pj9QkBZWw2iHDW0ILqn0eJhuvph?=
 =?us-ascii?Q?G3jxS4p53D9qcxtJSov7nl79Mko4Q7RJF10Ujhllkfmk4s49knPwAuwULrk5?=
 =?us-ascii?Q?LPKFuqZF2JGO6oSmz0cXTqecCz+xCR9cMZ8rGBz2r9gtZ7Rm37SUUqoDDflm?=
 =?us-ascii?Q?qiJjaf2xQ+/W/eUgNaDSGtkT8iwhtgFwQtdpzs2+GfEPrVz9uDiMsgxZtlJI?=
 =?us-ascii?Q?GHwTwatUQPc/BH2tHRucCW8cjCoy/oondanfBZkdBGqkKdogecf91CqRz8/R?=
 =?us-ascii?Q?x3LQMUgb+CrEO5OmdkKmjG97pbad8BZ0S1SQNpF28SIi1CGZ5NVe3mjBo5cc?=
 =?us-ascii?Q?InNnWyj1Pm44vcWdP6G8/qIsT+bnthyBwRVuDBJC+YBdy0jOi7BZ7spa6VNk?=
 =?us-ascii?Q?ZWfZqb1u5fj7UHrvqRf3Wpqcj/dh2eRteEObJGkw/33dVffBfh1QiERV5kOU?=
 =?us-ascii?Q?Z00f7UmiammlK2ref5ZrdMKE8C0Xh2vqIGwbVNcBUox7H/MDGlu2+PW1yZDg?=
 =?us-ascii?Q?dLncSXGsI/3VMrh1qREIj6hkgHYyLCahSkV77//Fnk2Tdrv9SpWZU5Rv8Y2d?=
 =?us-ascii?Q?HI8XZXJvher9v/V0GUJPyK13NSONhaspa3DFgLBixe4pctQhKOWKtfxUs44z?=
 =?us-ascii?Q?3/8vdbLYSoZnoI2JUFNf1G5XjSsPTIZYu7ilUaV166FySoT/xIfK0L/0Sljm?=
 =?us-ascii?Q?lL9R+h6TIz3U5H3Mtu55L4qVoCia8cbfYoYLND1LTm2b6D9BSryeWa1z0BOF?=
 =?us-ascii?Q?ScUjVOipW4p8tKNbdUeBJe5HqSR1CoybSGKm7NRa7cTtIpQ/P8WUQMNoUmqs?=
 =?us-ascii?Q?rA912Q9XojaG6s2BCdmmniELdyBokDWw/7ufHkyKiN8+unWj7OGAzqkk3Yed?=
 =?us-ascii?Q?xglxQBvvE0CY3jMZYzbfJ6b243hPTOY7t9mbOKiJNcC++2cnZ0mWEvV3qQWc?=
 =?us-ascii?Q?gRs4uZUhMBB5dpBfYorjkLn+i45Jttu28iI/Tv/bpdJ4kEss6ReRKuVC2soP?=
 =?us-ascii?Q?xpxtBubpyxvoEU5zga47nMHdhC8HnyM=3D?=
X-Exchange-RoutingPolicyChecked: qSLJL37rKezloSz7S/A5+9tWQnrBZ9+cUIJItkLLK2UWSgkjQOZ70nFy4fdau+7/unRlHI7ZMTDzHJHEzZwSo79kfPvZU3RwiWkT/oS9AxKvyfoEfg+QFoHAFO5x6/JPzK2knsVJGJ319hRjaiPGZa2gdUp9lRezZH6NQeY1HMGZGG/9NG3rkX4v4VfVpYBp1sBk0iq0fYlkNJXt84uUx/J2XRHpG2eUrPB+0KXN1wHS+CSriONg8V51wQhk85KMisi5XcP5VJ1SueOMvnsN0IN9kXEj4absgGUxZRrQD83H/i4xlv2OKlcnp9XIHPNnZTdm2Q0TrCcSWEXu9W7gJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d28dfa-2cf0-4e83-a642-08df40b463e9
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:59:22.5620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7b0TEMOA1hMRUjM7HrhooG23vs934eEysIWH4bH+o6Vse97j+uC16ZsLtMSdV4Kk+pEq38QGWP+tgsfziw+Vm3dxgTIqGB0x4KYD9IrT5zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
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

The stolen reset test reads and writes stolen pages through the ggtt
error_capture slot, but it does not take ggtt->error_mutex. The DEBUG_GEM
poisoning of stolen pages, which runs from the object free worker, and
the GPU error capture use the same slot, and both take that mutex.

So the free worker can change the slot while the test is using it, and
part of its poison ends up in the page under test. The page then looks
partly like STACK_MAGIC and partly like POISON_INUSE/POISON_FREE, and the
test wrongly reports that the GPU reset modified stolen memory.

Take ggtt->error_mutex, nested inside stolen_lock, for the whole
sampling and reset.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index aae9b55ee023..f295edbb3feb 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -98,6 +98,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	}
 
 	mutex_lock(&gt->i915->mm.stolen_lock);
+	mutex_lock(&ggtt->error_mutex);
 
 	for (page = 0; page < num_pages; page++) {
 		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
@@ -182,6 +183,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	mb();
 	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
 
+	mutex_unlock(&ggtt->error_mutex);
 	mutex_unlock(&gt->i915->mm.stolen_lock);
 
 	if (count > 0) {
-- 
2.55.0

