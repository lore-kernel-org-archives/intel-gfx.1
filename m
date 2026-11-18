Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6EF606A31C
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 13:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NSLxKKCX;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Wg4+kRTY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6314510FC0C;
	Wed, 18 Nov 2026 13:03:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E0010FC0E
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2026 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795006973; x=1826542973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CORvDZOfy2yO24qhBn9hj4yzv+dbK66PuJJBpIkBMnU=;
 b=NSLxKKCXUR/eIXPR4c+wZ5d6Dhvw0sUhT57kh8N4jwbjP4L3h5Y8yxBh
 tPVUjUurpik7aZT+nC6/uZUmDBQvqZGa3NKNI9fjdpJRpcyUVyZyXlZHR
 4Ofg4iZVnm7n7bqP81RZ0su57fzznUwPnBMVOtFWj0yiq95m0qqXSWInd
 8CeifjlmHp3ZWLkwvaXyqbUe0lLh47jPieEy2fpN4IIJneZoDChHm2KdJ
 PtqJphQYeYWdU+SAV/NrMHqdvEtGUWyY5FPR64qDKz34KbguAnZYeJIm2
 wZ/RmxwxYobSRv9LCFdPf3/aVKNpvHWJTWJKPwueUQSwSF3v3veTNG9+y A==;
X-CSE-ConnectionGUID: ZKdWNQgnSHaLByqx33JZgQ==
X-CSE-MsgGUID: R12m1m7bQgmp7A2qIJnxpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3805752"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3805752"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 05:02:52 -0800
X-CSE-ConnectionGUID: JaB27ChDThihWgHss52Fog==
X-CSE-MsgGUID: B6HyfW0sSOeTybIPIyY6qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10027111"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 05:02:52 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 05:02:49 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 05:02:49 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 05:02:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjL914AEqtJeGiGyCszMo18hQXA7FlpNSbgbbOhqSQ3Ij9fVbUme7b7b0iycLHpgFBB7SUX0ZJlBfRHM8TgnLBTO70mz8aBpsSgul5t67tpGNaaxmiZSGCCJpf5ZwKQYjY2mrWORfeeCkkUgX8rzzU6fozngCglu6PgzdpaojSIXFVejC1MFEJUaq6FtcQVbWIeFmEHzCvGQN1UmwEO7Z2CA4vpmrmxV2bqab6Ne3ZJBkrgb73Dx0pfZpDGTr/BFT490gTG9nh4+4DVRIgYlGlAUHHmhdY4N/5SOwnBR3iIOfZovYGp/Z2mwcEOVk/SdkWiwKZj4mPOAkDkbKGuWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnzWf34jiMqnuE7KsJHovuVTkLYNlKUTGZSDKBfH/Wk=;
 b=CfEwJBrKz21YF5vSiqa84PmoPOO6wChwnScX1C3Vhk26EtRcwpVFY1tm0XepYRNJXrxLoFY5d89o7nwYdWyJPEDMOYt/qRl5ifSIuLk0cWlVNdfMN+gG42ojFwVx57ezQ5Hvea7rxX4SvFqe4l5jRqtZEFnBRdsSCp7CMOKvSH286vzhljXxtR2iuAz0t9CwQMNnd/KM3ms9JYTYjUrm+nJgK4MIAhz1SWW6IayC+N7fUoBSAPIyjtGJJBWWRLVVxWxcDwtZfnxrFYT/ZQi0ZuL6qfv8Etf06y+K7oJ3rrwHD7an1nPphd5ELfK8fzFf8uM9vlDX72qLpcWXe5no9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnzWf34jiMqnuE7KsJHovuVTkLYNlKUTGZSDKBfH/Wk=;
 b=Wg4+kRTYZsarVy0fcCf4RMSHAhyudtP0GYaquiy5z9+SC3peJmHiUU50QZqJ3qS3/EnDAKMLrsLNEr4nIq3/uTu1M74Oj9S4VmTE7627VOTvZkoekdu1cihZjOgecEHH5eiAXkrUSNNT64dXYSvyUD660TYSKDpT++GP8ftm5jk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by IA0PR11MB7260.namprd11.prod.outlook.com (2603:10b6:208:43b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 13:02:47 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 13:02:47 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: <andi.shyti@linux.intel.com>, <chris.p.wilson@intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.niemiec@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v6 3/3] drm/i915/selftests: take error_mutex in stolen reset
 test
Date: Wed, 18 Nov 2026 14:02:20 +0100
Message-ID: <72a2b16b5a4cf8deffad74e8ae85a586a5d693a2.1795006734.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 11b9f12d-0c5d-4793-4cb1-08df45743e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|261022115727099003|261026140227099003|261026121527099003|11063799006|261022075727099003|261009223027099003|261021123027099003|261021121427099003|261022105027099003|56012099006|10067099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: E+MuESwuxky37HaVzepxw0IEXXfCJwn9Ynn3XHV5FXzAIiwmrBMSqXqrScJ23k2ecl52HfqbbxSQoLLTiqeb0nV++Fsqwc+MEpagaYNKeiE6q07SGWnUKlBcYMmPP4GvYXaUleqZIoy78B1ykwbQK+mq/SWph/m35dBUmH2CB7S+A7jq/Fe45QqbMYhX+e573mnd+0OgyUVZe/7CfRVBanBZ287tg1EarxEm5BZtL015PRvBSZaZY9cUxKmhL2Ani5wguAxWlfku/vHh6IZY9nsSnKRURKWlQcwEHX+kBlqww/5bz5hs/PIwnVfSJjA1kOsRfZLzj9K8vaD9cYI8gdcGYLnMrCWjA1ubhLsSV6/LWuI4dPiYMR2cNUF++NCfi80NAr9IAFIqFzFB8rcO4y+APABAkC3nwbQYa/yGujlcEdIqVddDVC4Lv757uafJ5Ato3vgYfQNyDcqXore6cv1kwawUX9TtrsFmF4JZiw7QtxHzyzyUp5gzesWcXtQD+M1OGn9CsK9YYJaJ+I0DuEiOWO4vWeUdUbqPkmCBMwSQU69rpcjnHqB53zmjxGjv2CZ+P9BFaWmofvEWAqas4LPxnLLxCWniXFKWHxd7q6PL+xBSoEyvCuqtX8SiE+IfXpoOlYB67SKit/vZC7siSG8zP0iXEbonBQp17Lph49w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261022115727099003)(261026140227099003)(261026121527099003)(11063799006)(261022075727099003)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(56012099006)(10067099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SywjiNm5vRj6UtasNw5YyvTlzONPmyYICcMUCxc/mBPpQn/XgsG2YYSwa30h?=
 =?us-ascii?Q?qAGP49+5EA8RH9tD6KqLDMQhMq5rbFjy7VHKK2OKL4JxnEkV7MqM2J1tYQUO?=
 =?us-ascii?Q?quq8vi9Fg5NLW58qLKZWV3YzU7o7qfxmqDHEuTgHPZnNVdFItVXK1V8wDmNN?=
 =?us-ascii?Q?+3vjBJMvya7eCucMapt7K8DI6aWxAPYnPMx87LXkWh4+Bq3jnPr4XvaPN57C?=
 =?us-ascii?Q?r/PvvMM3xPNfcEgZpLQ6+vRo676VPIP1lx/7NYXbxtMp5fnbvX5byiP8Yjb1?=
 =?us-ascii?Q?90j/TnAlqADrQm/z/4EVwDhpOjvk+IZXhi6PEvUZ/4ofuPsfHeYopX7F9f7X?=
 =?us-ascii?Q?fA7PqC00+TVPNwC7QGJhURE3cyK/zU6kmgB69m5GvjguIN0Z9quLLXtfjuN8?=
 =?us-ascii?Q?3BgqPJ9fNkUgnQAKjYL4QKJH+8s/PCBT7ghQ5IvdWVD0fJC+h0RZDb9OyXnK?=
 =?us-ascii?Q?82MDOsc6YeEUYXBtx9OCIPONGG9xYDBpDluFRYZoeZ4mdes1vU9YS2d++q/C?=
 =?us-ascii?Q?DPnIh78VfKqRCUphuuVkfSjmd4VKns8X4mfdYQQQkPeZtE2bhE934+q0gjBV?=
 =?us-ascii?Q?zcqlbkoxUCqal4JNH7axDA8+DY6pKs4OhYU0wrIadFkPyqh661UJMx4y5Q/u?=
 =?us-ascii?Q?I7//Ey3zu1kNf0o+0K97H90NTdRhW6wIdG91pJU7Bn9KB1TAQ27c2EtsyFo8?=
 =?us-ascii?Q?NsWOdX46IV/15ZChFi80XhIwNUwBJlc6FtQ5fmY6w/gf990IGr41VaHUBRNn?=
 =?us-ascii?Q?aQIlYyixoWt1EtA5rbt06IVm9eqr8tE87PCywcR1ShzV1nQZS9rMlw14I9dl?=
 =?us-ascii?Q?mYpyf+W8prbF7sBYzzplrJB9qRTBz6OrG3cE/mvmY6xsDqYHeVlq4Dsz5HLO?=
 =?us-ascii?Q?v5WPw8HEmiAXLAeCnrGalwRCKiTK7s6dNgVtdnqTruc+GsyfYGelM8T0kzP7?=
 =?us-ascii?Q?16kTvGhU3lgEcwNWkaYejOOhqT05qXMNyfjPPek7VR5y1MI4370oFgKEFII9?=
 =?us-ascii?Q?9rt+W65X8NCRCdRqi7DqnuboxT94O2YXcyEeFTeodUyHEbO/QAqX7aG8hTNT?=
 =?us-ascii?Q?Ye67JdE/tSz1IBLrm5I91djhIRD7pjKmF04eZctYqAP0+h8VPVIqMksUDH9V?=
 =?us-ascii?Q?jdft9wIzh08B+aas09ZexHaoJcKBVhBopR6yIi3bXlojBJKUGaZrWexJrT0q?=
 =?us-ascii?Q?+h8XWD6SQOsYqvnKgz3N9aEncN/jdQcIjMIFASzheHhnRw3h3Zr8EEA9PPRe?=
 =?us-ascii?Q?wik/zKtvmPPL9XzkhWiZuS2OYphOH6C52i7qVarZlSooLimOLrKHA1u8rh5V?=
 =?us-ascii?Q?0k3x5Y3uhcirbJNZmit6VPw7cUPixCexznGycfQFNq3Tr1i+SXNPuHVfBrcf?=
 =?us-ascii?Q?MVVMssEpO7SJ4gra/OF5Jya3Q9aHRSNkyaTRQsKvuZn5mXjOu3kwkSBMaKrw?=
 =?us-ascii?Q?z6ObOFijx3np21Ju/y3kVZV2814aooMV9R1vWZ5dZII1oCTweTtEOQ7rwp2D?=
 =?us-ascii?Q?NTqV3hwvUuIlVdxte3W84+bOmio72qwzfaaPguDWkP7vIbReQwaBUJgVeG18?=
 =?us-ascii?Q?bBaLyZ6RBwFP4A20POQr0rBeKqyxPE+mm9+QyBM7mMFlwM5sChA2SWwS/XIu?=
 =?us-ascii?Q?Y7fJXUuotTy3C2irE20XON0aZYrnzWzmSpmcwddohfmkb+0gJDvIKqZbjW1+?=
 =?us-ascii?Q?KFT9NU1B/8NTkpqhvJ7uoBxRUdEax5fAC1yP+GWE5O22x8nvMR8z/IM8NNZT?=
 =?us-ascii?Q?qgZ25dshOrc25mARRx+TYK8MQPonHyk=3D?=
X-Exchange-RoutingPolicyChecked: 5JkXrk55MsjOx8omuxsYb5RzEvlZGyIv7muM2lkdlPoLZnr9DhcVcKcCEj2a0Z5R5c95/0qynDlidKF8zkDYyQWfkf8T+CQtq8ANa6TaogRoEV6t1uV9J+tZunzz0uimYMxYqkMWI3ptyWhKEX8N/7FQmqWPi4UYMb4MPagrHJeTt6EVr5NQRTK21LNuprgzcVKe5JiTZgxabhupzwK9ZuvjKO3NCaKaJi1rO1B6MCYMrBDVEkhG/xC4TYq+rpK8Y/ko4hEwUoOFJ9WbwkRSCZXNZ0P1GYOuxLvMgs4efhF1pHaOP9aZ0v4aeuKXCPNeI5pRAVSw/tIhXg3VSC0q5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b9f12d-0c5d-4793-4cb1-08df45743e19
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 13:02:47.1458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3L8q1FfJmO98TmAAI5Q9DjU5b3uoCS6g6JCs8tbia4Je1wKGAGsuj0/CxzONPo84lvKEPW7iWoHUCMsA5x4UdoLwgYQ/XXf6qXeY6DOjaI=
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

The stolen reset test reads and writes stolen pages through the ggtt
error_capture slot, but it does not take ggtt->error_mutex. The DEBUG_GEM
poisoning of stolen pages, which runs from the object free worker, and
the GPU error capture use the same slot, and both take that mutex.

So the free worker can change the slot while the test is using it, and
part of its poison ends up in the page under test. The page then looks
partly like STACK_MAGIC and partly like POISON_INUSE/POISON_FREE, and the
test wrongly reports that the GPU reset modified stolen memory.

Take ggtt->error_mutex, nested inside stolen_lock, around each sampling
loop. Don't hold it across the reset, as the GuC CT worker can take it
from the error capture path while the reset flushes that worker. Use
raw_insert_page when available, as i915_vma_coredump_create() does.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 26 +++++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 09a08a91e610..bd5876da6449 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -36,6 +36,8 @@ __igt_reset_stolen(struct intel_gt *gt,
 	intel_wakeref_t wakeref;
 	enum intel_engine_id id;
 	struct igt_spinner spin;
+	void (*insert_page)(struct i915_address_space *vm, dma_addr_t addr,
+			    u64 offset, unsigned int pat_index, u32 flags);
 	long max, count;
 	void *tmp;
 	u32 *crc;
@@ -90,18 +92,19 @@ __igt_reset_stolen(struct intel_gt *gt,
 		i915_request_add(rq);
 	}
 
+	insert_page = ggtt->vm.raw_insert_page ?: ggtt->vm.insert_page;
+
 	mutex_lock(&gt->i915->mm.stolen_lock);
 
+	mutex_lock(&ggtt->error_mutex);
 	for (page = 0; page < num_pages; page++) {
 		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
 		void __iomem *s;
 		void *in;
 
-		ggtt->vm.insert_page(&ggtt->vm, dma,
-				     ggtt->error_capture.start,
-				     i915_gem_get_pat_index(gt->i915,
-							    I915_CACHE_NONE),
-				     0);
+		insert_page(&ggtt->vm, dma, ggtt->error_capture.start,
+			    i915_gem_get_pat_index(gt->i915, I915_CACHE_NONE),
+			    0);
 		mb();
 
 		s = io_mapping_map_wc(&ggtt->iomap,
@@ -120,6 +123,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	}
 	mb();
 	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
+	mutex_unlock(&ggtt->error_mutex);
 
 	if (mask == ALL_ENGINES) {
 		intel_gt_reset(gt, mask, NULL);
@@ -132,17 +136,17 @@ __igt_reset_stolen(struct intel_gt *gt,
 
 	max = -1;
 	count = 0;
+
+	mutex_lock(&ggtt->error_mutex);
 	for (page = 0; page < num_pages; page++) {
 		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
 		void __iomem *s;
 		void *in;
 		u32 x;
 
-		ggtt->vm.insert_page(&ggtt->vm, dma,
-				     ggtt->error_capture.start,
-				     i915_gem_get_pat_index(gt->i915,
-							    I915_CACHE_NONE),
-				     0);
+		insert_page(&ggtt->vm, dma, ggtt->error_capture.start,
+			    i915_gem_get_pat_index(gt->i915, I915_CACHE_NONE),
+			    0);
 		mb();
 
 		s = io_mapping_map_wc(&ggtt->iomap,
@@ -167,6 +171,8 @@ __igt_reset_stolen(struct intel_gt *gt,
 	mb();
 	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
 
+	mutex_unlock(&ggtt->error_mutex);
+
 	mutex_unlock(&gt->i915->mm.stolen_lock);
 
 	if (count > 0) {
-- 
2.56.1

