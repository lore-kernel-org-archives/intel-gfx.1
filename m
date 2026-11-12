Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46643606A323
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2026 11:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YMqecGLc;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=MQBO+IYm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD71112065;
	Thu, 12 Nov 2026 11:59:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1297611204F
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2026 11:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794484766; x=1826020766;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=G3Ync881vLLdHgVpj9oKzfHi39UmqSYKkrGY5naoDeA=;
 b=YMqecGLc6w+A5xG4pX08TEc//LJ+kJIuRFmzJV7tOzB59W6teUOD0Rsu
 Zvliv6EWbpQGWijkY9O9h034srStRHViIZLnKEmnNcQJ5PjUfQG0m8vhW
 8eDioj01QfD/A9tZ+Qzjn/ZuGIUJNnZaQaL9VTw2BHhHsJQrqDOgYPRyG
 W+BCJ2g30kxkgBCP9gJLlatwTNqEflODhBbqZaC8oph3CWfBqYd49v9sW
 9xs4bTdd4G2Ii5PhaAfMelvj/myZU9avfCDonI24JT2YwXxBCnfkxqnG+
 7Ktw0nhSk8hoj/iBNia2OSrIvOAaH14wZiGY+f1AyYE1vA7i61p0gnmIc w==;
X-CSE-ConnectionGUID: QsB8m+91SH60SlXh0NBi/g==
X-CSE-MsgGUID: PKyt4urhSHeeiEdlPRrsxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3178055"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3178055"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:59:24 -0800
X-CSE-ConnectionGUID: Fr6M+NNZQL+3k8pdQV+8tQ==
X-CSE-MsgGUID: XN3Qu+IzRF2O9mXeyBQuxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; d="scan'208";a="10538099"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:59:24 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:59:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 03:59:22 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:59:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8mT1Kx1SBRleW7+1OAGFhEqm2SIvf/1ckGxRHKJO9ktfWxJJpfLSkFkGUYCc3x1TqjTxV1VZiTXvPutYQ5byOywlmBELSBn1r/lxBeM6SRlwI4763Z2RrjwbZaf0RgwmJL4GsDFqvOtBYR4JO2DdmbK5TD41dTF9YSgccr0EFr49xA7kMbzILTBOzxVwHdehDmWcltvtBpa6vOOpQXtz9x1Hbt6IuzQRn0Tx7vrhyxH3XUADpq0MNsILl2dXonhuSe2Njdonj15R9Mv7qm0j/gNbIq63F/C2BuTqf/k8LkgzJHdUmH6OAHUTPFfJ8ZyJFrgqngWjhu61PQEz2JJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9i7UjZHVKLwjvLdvTmcPNxVrv5eGrHZiLFMRPD+jQ7w=;
 b=jpyttUW2gFgRj+TPFYwO/b3c5/sO1NExH+UwIhD0tBf1lEDtCEwSdbx8vwyo7YGQsY1K+/mDPlwEymhsqFr5j0Hc2Ox1hp4vURUMTJxfKtrddJLhQab3Hry5Dv+xdfIzVJtcmdsVUhD6tcnM5GjfehFnQi1FPIToyiU44mzwtrphdSblFKpYd0vqkFpdMyyqfyzpAi3WvWaz5MUjcRAHW4RYyi84XpZjhWdAkSupyBB+2uDlHuCKqgIpH3CmIvg8YxmfJ7ub1u0Zw5u0L8Y0sPj0x/67RKr3VL1NzWYVCKkm0qIa9/eHaYhw1OEThET9uu6v9PpWU+mm+9/YjJjX2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9i7UjZHVKLwjvLdvTmcPNxVrv5eGrHZiLFMRPD+jQ7w=;
 b=MQBO+IYmx/zDTWQ9a4tpYeOLP33sbreggqifSj7ZNX4ISlwrOqifGnffxxo9rYN5JVmlMRM4zdsakfuoWOFhAQb99tqR+rRa1HHjnI0zaza+Kwr8JDRdlb7uf+Rc1ZhHJySIZ2ToquXjv+RWrk9zypmaaGsvboAUVeOQEtes65U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 11:59:19 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 11:59:19 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: <andi.shyti@linux.intel.com>, <chris.p.wilson@intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.niemiec@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v5 0/2] drm/i915/selftests: fix stolen reset test races
Date: Thu, 12 Nov 2026 12:59:05 +0100
Message-ID: <20261112115907.16263-1-sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0033.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::13) To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|DM6PR11MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 78937732-8f79-4fe9-f3eb-08df40b46204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|18002099003|261009223027099003|261102123227099003|261021121427099003|10067099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: HMx598w1x4I4GYc/2FFtDkfwh0SMD1/o5JnP2utmoiadCK2okAyharuo70ReS+oXLzI04Tpqk/l9KH8egVo5XN74Or0RaSkFuWorxqjgy+ROzZsCzhWqqCHzkaTwgShxDFcBsAwLYMGU+t6OIBGe+HnFbzDcLfvb1+f0eW2e3sfOk2cRXiWT2tTt/n6ieQnoqXZ4/P+8g/7gge2fPv07pFAr4yd8FcyWca/cR5xTN7b/tbsylBQGjoKB4o2AGMkDFFbMzNGTNKsLJXIumHATOn73PT/+CDfMxdgnY/yN+10vrtgVTvwsQQnxMmuZcOtNGbJWZS5di2q5vlJrSf7BbWpbLK55p/PCyJGgAw0pSfzKrapDk+GN1CeMjAhdnl616LtOzy0eT7uLgNHgTwIrryDgp0DoA/d7j5bmUSL7lARGm6eEL5vBMjuhuHvFwvWugad1sVB6qLI138ocZ3SwlVufk1SytPtkeElUVDbf9cf89qMnJYAvxgZSLK+ctvMJncCmY4Xx1CLSxTTpU7KiN/qUoKreFQu93jRLCLRNfr9YKAOBu0IxX+MmTkDh8K1j5eLh0G4JgeecD0wQ4aanqbJv/KeKQ1P6EWBB9N5FS6f5qVZUmkKi1gNiHpwV8G8oO6I776qKqqnB2SZGTsSRMk5uDnRE0zKrznBH1A9qwE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(18002099003)(261009223027099003)(261102123227099003)(261021121427099003)(10067099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BTKYqV3TET96rZkEYFRFo9rDaY0t7FvWq+y1Ov2B3HbudVeM7y1ZjH0vK5XX?=
 =?us-ascii?Q?sonjBOjkNsnINZOs4q6O6/MT8HrwgRnGez1+Yw1py3hVGh34hjh7EbBbI9kO?=
 =?us-ascii?Q?kct3jXEizRU6Eqe+t3L2DgNCVuF7pu/jghx8eClXKJHfyzibnCysWb5Qh1Mw?=
 =?us-ascii?Q?xGyTGK6g9aD9RXl7J/o5TxI4Iwy5jxXkDy7iRnuCVnjxH+kJFFT2MzFspWDc?=
 =?us-ascii?Q?g+i+bKFThYqpMMS84BFk4N7RmkeJO08CTgj+GvQojSE+//MGq3S/SWUt0UEb?=
 =?us-ascii?Q?ZY8P4QKk/5OWg1H/soJujbTnsbsQ6LyAyGcS+dDkvvdPP9lFzf7CWIosJ2nm?=
 =?us-ascii?Q?SSptr/OXKOSBM8xINoXcM5tkwtUcdw7ittFtcOGummrjYhxaUz1eYyBryAjK?=
 =?us-ascii?Q?i0Jn8/L9InmIb/PdKgkK82cj9cl6v/fG/A+BBRe/D/Os8M9xqgw6SIbmTqE1?=
 =?us-ascii?Q?umaZy2YRsa0GR0FmSNUHI1eLX2sRszpY2qBD0BiChjFR3nG58Fl5h0Wz9Oon?=
 =?us-ascii?Q?PD9U2EZ7ccALu8s5TJmVeX4MhGHrJgi6WSOOus3Ea/JfFXSXVNDs/cSfGGKD?=
 =?us-ascii?Q?2R9JUPJ6nx40vRPXwKrtMMcjfZfu/2qqGRBCb5W1cIjr/BGLXP7+Qg5MgPeb?=
 =?us-ascii?Q?rij9RQd6SOZbPy/kzzJfb3WEOJmcmfVTawQXxKgIfNAs51unJBAfBB+4lUrJ?=
 =?us-ascii?Q?GRhqmlAfbmSSoctPZ31XC46tGqw83GDjDmYLRBQqTliIPoADFAJrHOoFaXh4?=
 =?us-ascii?Q?zm8P6d/LTm54bHUlww0U4AlYFEhv1Yuc5W68QhTmLAylUMoa2lqLdrXaLLDT?=
 =?us-ascii?Q?X6JQBkfMVB+rUsb0x/n0JINkWtkqypLi8n17zXH/vqjCAvB2KAyyBH22S3+P?=
 =?us-ascii?Q?cg7AjIVjdZfgaMctcyxpStYiB2ogrEoXvD+qhSodAZ/nQmwPyTBBV7LT5W7L?=
 =?us-ascii?Q?8SQyFXimxAW+v36Y33N/mNnLAu7+UGCOjBEyDwXVG2Z81e4uCmnGUQQuXL65?=
 =?us-ascii?Q?lGE4PvmsgIoBBkt71I5zeuCX04/27Am7OBwHKecOyI9+xy9whdvCfu0OUOD/?=
 =?us-ascii?Q?nXWZkbtpEr+KoxedUlRtEDC55pZj3t6bx7WKJDALfuvDRizfZMMoWLjTl67R?=
 =?us-ascii?Q?4oMFI3OfZQZIOArBjt9zMWKP3/VS0nqi76mqyUA6kMUQz2BYH/h3IxG9ztqr?=
 =?us-ascii?Q?7Wg1E9fiPoL3BaiA8w/5OdhSSnLyDioo80Wd0VQ0yhmy0FDZbpib5F9wd2ay?=
 =?us-ascii?Q?gEhGHXOjz4p5XvMeGE6HyxWaPX7YLD63kTv9yuo4kpRYtvWFPwX/XDmQksPR?=
 =?us-ascii?Q?IakDqPSeWjOIw/EqQ4Lpoqw1bDsGQFp/MEbMPZdcQl6lQNanaVajy1PEq6/N?=
 =?us-ascii?Q?ckV2ylsGhAaIdTVZFrPi7+G6kUXfPzGiLLMNWDL5lzZoij8rx0DF0KESOr0v?=
 =?us-ascii?Q?EBBEOW/ifkAz6AOYEIbhxIqza+xKSqRxW0bEQNGxrMBqyIvek9E3zBaEFUjF?=
 =?us-ascii?Q?lyw1vvVtRQX45dAmvZFX38G8z7A2ieSNrA1mDPgT3Ge2SkYDbz4i18YlABQG?=
 =?us-ascii?Q?oLzS71jdCjKh1iOPZOu/bAUWM+1wLAoLHQMWKMpQDpKLU72QYVesHaN7M37a?=
 =?us-ascii?Q?lzr68noSbDX4m5WhlAHj7odwpd1wRWELxVBal19a4NutNw5m9fJG/NoInOv7?=
 =?us-ascii?Q?L4WEe9BGrX7/it5RTPF/pdLS9oNVq4IPdRySsVb+9fn6idjuTRC0vNKRzKvh?=
 =?us-ascii?Q?8kCPQo9qlzQvMr2cK2u/wcLCcpOX69A=3D?=
X-Exchange-RoutingPolicyChecked: ST5IyLyxP88Se+Z+KkmhSAG0AugPj/19TFonXAaAqzenz/IDnThpBwH7WrKM39so61kc/l4ZEYfiiC36Iw2FgAhgLt0MZ57bQFOFiIkkXcZEuEEb+WwCa9HHlzvQnbeevP2FU6WfCuD15u0mMcU//wJBUAjW09I6sii/evXnapMjhzJEvvY0pdyUEXUhMEdhkyi3W7VtCVr7SRtv1beXLq83zSOcroUvHDPT8+YPEo7ysZzR/yPpQqttCoXkbObn7068HXZcNucnns+Ftr0DQvab6rXdH5y3+LYWKdYOvpj2VTZ4lZgnWx368u08d4+wUBYXqv8UgDCWIvSTHG7zxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78937732-8f79-4fe9-f3eb-08df40b46204
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:59:19.5312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVfFov11c3tEcjolvJlz2Sw8gaRnZ/2754ATcwZALbCoum0NcoOhMldsIJZIQCFMdtsZ8Robv1mqMVnTuMCOEeWBY+I0p5oD+fSke7NouZk=
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The stolen reset selftests (igt_reset_device_stolen and
igt_reset_engines_stolen) poison the unused stolen pages, reset the GPU
and check that those pages did not change. This series fixes two races
in the test itself. Neither one is a GPU reset problem.

v4 -> v5:
- Hold stolen_lock across the reset too (patch 1)
- Add patch 2, which takes ggtt->error_mutex in the test

Sebastian Brzezinka (2):
  drm/i915/selftests: Fix unlocked mm.stolen in reset selftest
  drm/i915/selftests: take error_mutex in stolen reset test

 drivers/gpu/drm/i915/gt/selftest_reset.c | 47 +++++++++++++++++++-----
 1 file changed, 38 insertions(+), 9 deletions(-)

-- 
2.55.0

