Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98F0C982D6
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Sep 2026 14:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DED10EF13;
	Thu, 17 Sep 2026 14:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWaj3BrN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18A310EF57
 for <intel-gfx@lists.freedesktop.org>; Thu, 17 Sep 2026 14:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789655522; x=1821191522;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=HIedLYjGNvz0fmTugOp1bWjd3CLT+R6UseAOMbFeQp4=;
 b=WWaj3BrNHPpYvg+ftTbklgDaIcLyKhWatd914ZgvcSGYUIeYzq4+JPMM
 bnA8cdnHWyb7igrHMSM2OF29YwaKw9MHBGG6b3NgVSpyXKgwptBb2sAfU
 Y/HpYd+8avgVKJ++2ytxmYhqXo1j56GcpMxUJm5HUaI9wvDICbpG+qS/C
 k3O/pVGty1yMdM35Ke2xfVS/TtTy8BZ63PruuOEJl9+N85AUQOMjLsmk9
 g9fqLAu6ADZwHKMkc7MUYZ67hOBcWJinmftj8cRSpD304XemwCCOfKTNB
 IN4jodlAhR88DUNVs9QunU+AQ5HPdB5rWFv00lX+4lInqK2TbUs/3Khc0 Q==;
X-CSE-ConnectionGUID: MkFVaRQ2RPu1RQxaBHbM7w==
X-CSE-MsgGUID: u1kqibWNTdm2Jr/bVDY7Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="591325"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="591325"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 07:32:02 -0700
X-CSE-ConnectionGUID: FopmAKxWT0+fKOLZkXY3zA==
X-CSE-MsgGUID: l83EoZgaTJao6uZ1WDl3DA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 07:32:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 07:32:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 07:32:01 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 07:32:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZ7Qf+EcQvyogHGAdJTRwIATxqHZvkpnmdhtLSLLbhfwR7cvnsHMttnleB9utSgs+onLmxy4iVe1nrx2lIstnVGP3SnTx+E21jsTW/bSwQyQHSHDKSPuytnLFEwzaKCa/X0bhqziLmuwgckl6iXYmn295KEARdThLm+5FEH1waVKRlibMTNCNRaZsgYdqOnu+DIIFL1hE6nMD97SkjF/hru+I/1+Z2+6YKNYKNd9S45d7YLYb/TjloQPFskP9olC8ULjOckoE55dPGM0LhKwTKB5HO6LckCQp0CzresVCKikFtL0KhV3BMFTRKmfQQgiAo2Ww/VzWkyyYaW6LhrkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cq3U1Sny9DTWnFe32SrPNNwJcYZv8CeYCjXZ2Z2joWg=;
 b=DhWcJgKrHrMkB2xCxLbNR50K607r3nsoB4mAWghT9oPqLjp1LGDPBd9j+7tX8KoG4TzMpPkwiO2L6CEXugWS63Di2kOcFp1Jzmbm5kc8fjxA++NrjYL5nhzQnkiJRSdfqqf8jLJ4oK2mj41mR0j0l8FlQXzbDWD7ACktBv9xrCKPPwYeYf5jHS7U/tZOnNA2RDjB3FhX/tpgzOC+N5r1l3DY95MnQbGC95pkTaPJeJwqrIA/HXmpqsQpvUpw+lLCFx+vtJJcN35Jz88hTPHx5mRENO6s76tearEXAZxaI/q5CUsDi7bZVwT/mP74YwHFWYzMIb2RhYFeqTWd74D6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by SA1PR11MB8858.namprd11.prod.outlook.com (2603:10b6:806:46a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 14:31:55 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 14:31:55 +0000
Date: Thu, 17 Sep 2026 17:31:50 +0300
From: Imre Deak <imre.deak@intel.com>
To: Dan Carpenter <error27@gmail.com>
CC: <intel-gfx@lists.freedesktop.org>
Subject: Re: [bug report] drm/i915/dp_mst: Fix configuring TUs for a
 disconnected stream
Message-ID: <aqv51ovysYHHiKZ1@ideak-desk.lan>
References: <aqvz_dSzr7AbUp9j@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aqvz_dSzr7AbUp9j@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GVYP280CA0006.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::11) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|SA1PR11MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: ecfb4ff5-4d87-4909-405e-08df14c86c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|10067099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: PIC+3tCXqXQBBkwwke0YAynqNQ3rjegAkpEP6sEyiAgD2tOtdGEo3iooJzaeHaPB8/y8Gm7p4E0R8cn8P6VNVj35FUOg3NEgPV05mp5tI7Os4dOPYfZC045+gVsC2Vv5FplH0V3E+oj8+ZQGJoLfxpKxSjKdywT3pDJFcjoo28VCsvY2N7/r54+S8GKHEyf6IJNDr1mMUJS22cguZ9soKkMfBZlN5WGGx1q86hSo6wLtp53MdZ/hhd+XWsnQ9ZxNs7SY6+QBD1szJfpnn9er1NI8bafR4vamj0lZmjM0MyrojIr/Mk4efEYRY4SAjIQnB97yk5A2YrDrNKrCZFqnUcxB/70OTgXM/2NVISGkmLR+UD/fQxHVJJMzx8jyX+ZFBwczmwCr+XiaeYY9yKIAHb3m2RXmH5Xz5+hMTXz7cQFXY3C9m2qHzVgp7nCog2b2h6BGKtFmOjKvV7Y6N/OlLxl9UrfTl4PK/EJsnYWDo/EQ56Eyj+dzUXPUix5elexRsMPPVyPXudknhxsqqO6QrkX9etCOP48oL6uKpZ2BYzYYfErRfv2x9hedKhHc0/pkyL2saCtxy9GYdU9xAKJ64E6OATzDZhuYog8uEUeKpLhDwGQT4ZuMQLeAmSNvLIe0s/fSTeLZvDAoXBHyuTgFrbO8yaD37c+XEDe5NqFmCFc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(10067099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SuFTswu8jQgqgeFkagRRDlTUn9sHd5QJr3Bh7X+wRLca9ioRZPOQwaTVqeXo?=
 =?us-ascii?Q?KEbFNfpjwMH4fqDiNSxJdEGxi6DKQrFyqebUKb8Kmo9nKceDrbQTsBrxpN01?=
 =?us-ascii?Q?N9lPzwSQhIrBEmetSOERzwkSxOVwg89bnofz/ZyvDqyRZDUxFuuYo4zKYXDN?=
 =?us-ascii?Q?7FNGELZ7rk7Eydw3ReVLbnNEfvPHyIjm+cHyeuO1ksoh0YopeGn5OgzQf+AM?=
 =?us-ascii?Q?Z6FK74SddkWzhLCWLpZMfQd/w+hMcZB6uM5PGB1z69D2yLUsb5zZHkyX1xrX?=
 =?us-ascii?Q?9DPS5//D0yhWq9MNkONU7TpI/4CYxAHd/GfChZsD9viPglqdSqqVqLrXzTf5?=
 =?us-ascii?Q?OQ7UrNEe1uLwqeiSwTWoZcNcoAtLk6UCET2/zBCiAnnVmXq0pLoLz36cIjwC?=
 =?us-ascii?Q?BclKXIBflohMIFu/KrUFzWYVtf82MY1oghIOes/w4hkp+36HE6f0x/e+kIOx?=
 =?us-ascii?Q?S4PVZjjCyYWG3kTr4IV7lEvfUSIos26ZL3430BPTSMlNGOCh4D+SYzpTCmDw?=
 =?us-ascii?Q?kAAw37at+K/jIkY9oeMA6GL0y52iiqc8l0gQ7iiMeracM/wmlurRhuQFlWA7?=
 =?us-ascii?Q?xuGdpF3czO6WDifTKycnJiIG8CfOVH+sSyl5ZVbEy1jYYCsaNbfTh/inLQhs?=
 =?us-ascii?Q?U2u4JcMqgTJZS3oPDOjsbxSzfeFaJhu0SCAOLS3PEnkbaQUP3OeY6AmJn0oF?=
 =?us-ascii?Q?So2Fk1/XaGkIEEfizuHea3vyNnkD6T86mloH+5Ic0Y67PX82F9057/uFrn4u?=
 =?us-ascii?Q?rULo4rgfrEfOOnAKI7mt57/ZN3ALEa4zGjS9CJw8yZ4GPuhEfsZIROcxKS7c?=
 =?us-ascii?Q?AE65ZyOG92wI1sEZlc1s5sb0RFsMYWDL7Huv+wgqvpBVC/SwXtDd4hqDLF+v?=
 =?us-ascii?Q?pn99FCPdHOGKAW84tKCVovGyFrHJSojYdriJPn4mO+8feIVyneizF/2Orymi?=
 =?us-ascii?Q?zr49wWk3RtokHN6lXZLO0zmFBXsAm/vjQSzC5ACQd/a1kkCADyDd2jccUli+?=
 =?us-ascii?Q?txoQGEBsWl8zPladHP7nO9sunpoK6hQljfZqqF3T14yXOgREz/FgG7xJimmX?=
 =?us-ascii?Q?WB0Ytx+jdNJnytnb7pmQ1eDKPiZjzG7U5VcTcwkvB1UZk3CEtT0FWUz/7nhS?=
 =?us-ascii?Q?2vaPOu6JrmDvBn7/AEtSRVT4qWShibBaC4jtHuD/PcrfnB7C2h+Tc7mxuO46?=
 =?us-ascii?Q?OuZyG9MHQLU0fTtemCLDX9GjcZRjnLt5NUHVoYZpdOI8qVNp6syUh0KPxF7g?=
 =?us-ascii?Q?8yHx31AZ58D8jSs7tUca1Ihf56IH6adMKWhHkErkpSzC9NOsOjjxqi7RkL4B?=
 =?us-ascii?Q?3QyDq9BlWjVEfW13g7XgdKmZIjiRQ17lTuzEmtjdZhXGAaBbKkxtKfLBu15Z?=
 =?us-ascii?Q?BlRHw8nNItYIL5jAc3cShqdleltQSsRQwuVp8LUP7pZ+L1ESYbMAwp8RproN?=
 =?us-ascii?Q?ERB0WXWMNthehv3XnZGhP6kGfCs1dU4/99JZhAvJlRdNAB5W6n18CwKljFhd?=
 =?us-ascii?Q?qORRw2ld9vOUmDpSYsD1t41N/PNbamIO4Hzf8153Fa1DW55TNSM3zZBtb/7v?=
 =?us-ascii?Q?GDdvzhDoIyi2VFIr9eShpP3JzkiX11PB3CS4kuzAoAYTX/exZBrfg25CBLsw?=
 =?us-ascii?Q?CrCmKX1uuRWstQgoK55VQLFhP3olqVhxWKTgIhAoAkGUZbAhvmfzlUkNVbNN?=
 =?us-ascii?Q?QEwy6+Yy2UHwIsV1Sao5NNSHQyO/7WPAg6isT4iJBIJtyifcrwXb3UUsoIgU?=
 =?us-ascii?Q?Ws3t4/+ErQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: sP+9dPgNIvhdV64AvC0q3b74woMwJrUEZrJ1/qlidMzu8sAVLpDw55IpsU1X0CVgjzlWFcuGa687H7JKV0exN/Amg0wp42dFHDyABg1kg8F2LfIA0w3ROjqHWAaZ1NW1EXjKlP2FNXRUsDWMAL+pyi3zgB6BGBik6+2Cntf8FBtbyksa4/5A4i9FN0G/Tdkfk+1hv6n7D2m+MaC/TymQN4oOjvEhjquh6BAX5VPv7ygc4VlC39Yd2cgxSd/H5ksc80w5WnrNHv+9ruNhIHKjVnbcheRNW3TLqC/nou10EDmmMv0WUQQA9sj1vznIDy51p3EOlx8ltOAakACZgEyl1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfb4ff5-4d87-4909-405e-08df14c86c5b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 14:31:55.5044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqWnZbBiRqb38p9b84Xj+lNwho8L0XPT/WPpe3YjVgCsHy8AXmiGVVhVS/Vph6SL1krzHgSxRmef1IFXcI22JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8858
X-OriginatorOrg: intel.com
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi,

On Thu, Sep 17, 2026 at 05:06:53PM +0300, Dan Carpenter wrote:
> Hello Imre Deak,
> 
> Commit ee00f8fbb2b2 ("drm/i915/dp_mst: Fix configuring TUs for a
> disconnected stream") from Sep 7, 2026 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/gpu/drm/i915/display/intel_link_bw.c:69 intel_link_bw_init_limits()
> 	error: we previously assumed 'crtc_state' could be null (see line 67)
> 
> drivers/gpu/drm/i915/display/intel_link_bw.c
>     53 void intel_link_bw_init_limits(struct intel_atomic_state *state,
>     54                                struct intel_link_bw_limits *limits)
>     55 {
>     56         struct intel_display *display = to_intel_display(state);
>     57         enum pipe pipe;
>     58 
>     59         limits->link_dsc_pipes = 0;
>     60         limits->bpp_limit_reached_pipes = 0;
>     61         for_each_pipe(display, pipe) {
>     62                 struct intel_crtc *crtc = intel_crtc_for_pipe(display, pipe);
>     63                 const struct intel_crtc_state *crtc_state =
>     64                         intel_atomic_get_new_crtc_state(state, crtc);
>     65                 int forced_bpp_x16 = get_forced_link_bpp_x16(state, crtc);
>     66 
>     67                 if ((state->base.duplicated && crtc_state) ||
>                                                       ^^^^^^^^^^
> Check for NULL
> 
>     68                     intel_dp_mst_stream_disconnected(state, crtc)) {
>                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Possible this also implied crtc_state is non-NULL?  It looks more like
> intel_dp_mst_stream_disconnected() assumes that crtc_state is non-NULL...
> 
> --> 69                         limits->max_bpp_x16[pipe] = crtc_state->max_link_bpp_x16;
>                                                            ^^^^^^^^^^^^
> Unchecked dereference.

intel_dp_mst_stream_disconnected() will return true only if the state of
the given stream's (i.e. the passed crtc's) connector is in the passed
atomic state. Since that connector will point to the passed crtc, it's
also guaranteed that the state of the crtc (i.e. crtc_state returned by
intel_atomic_get_new_crtc_state()) is also in the atomic state and hence
non-NULL.

> 
>     70                         if (intel_dsc_enabled_on_link(crtc_state))
>     71                                 limits->link_dsc_pipes |= BIT(pipe);
>     72                 } else {
>     73                         limits->max_bpp_x16[pipe] = INT_MAX;
>     74                 }
>     75 
>     76                 if (forced_bpp_x16)
>     77                         limits->max_bpp_x16[pipe] = min(limits->max_bpp_x16[pipe], forced_bpp_x16);
>     78         }
>     79 }
> 
> This email is a free service from the Smatch-CI project [smatch.sf.net].
> 
> regards,
> dan carpenter
