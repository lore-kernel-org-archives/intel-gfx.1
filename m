Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B3DC982FA
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2026 12:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F09610E483;
	Tue, 22 Sep 2026 12:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5YVfkZS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E1C10E483
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2026 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790080031; x=1821616031;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=hnT9xYsmtqATpq49QBKSrn2LpboJpufRVvthrU8OxD4=;
 b=A5YVfkZSUvvUNx+bFheO6EUGZ+IEcChzml6VHWMuyjWLGARHWEJkIvQV
 +aTnzW49pXCjlXJLpnNZxnHWqSDvnN/EmjH5lTrFhorU1IddqbWBI6lh+
 4D3SSveRUuBLN4XLUJNRrVr5lA6YptT4vF5ci146WAYZfnlPVct6CSwnV
 Gfz8Szr87wprl7jQypufNcqSbedhwDMMwObFYVWgG9OwULSWBTPZ8fISJ
 0uycBot7D+L6bSRTLDy28xBFOmG2A8LBub+o5ZdyEA+1A+boA4OfVUpUi
 XQesgwm15vP7BCdhxUXl95qDtvCuLmveMBoHQgsjQWc5awKzDFszXMj3g g==;
X-CSE-ConnectionGUID: pPS6+BUmRJKgiBkLiNFKAA==
X-CSE-MsgGUID: 3BZVvO32QMSWI7xv5iHK6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1180332"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1180332"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 05:27:11 -0700
X-CSE-ConnectionGUID: QvBEFyeKSUiajf6+mqJ6Gg==
X-CSE-MsgGUID: T9xU2EQqRp2Gk9p5yx8cDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="277897669"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 05:27:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 05:27:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 05:27:10 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 05:27:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdaQPySmDKifzNGGIpnEexLK2xR2tFB+SYYAuRCz5cPxFmJ+EY6ML54FX3SVcZ7170myA28ww9NqZuqG6nk9gX+/s0Rl/wxiArsWM7gNG5dL900WeFjnOAhyzyY595t5hZswT+Ym/9nUPVlbhk9ufSgifv14C+5Xl4s5mr/6qhZ2GSaJ2tyE8VstzEJP8yRK6I27nuzzUL0rByZHNYYgGKvDcxIsxEx+lqoxQNM7gLP3vjDUBmalhi5gkOkBPglDMe6BS//uUI1EiUKtDOdYKGXdAE8AlxAvyQUpn98BDigpCUCyEvS1eCTdRYasuJDMZVvFbPkGA8JEJdQp9pMARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0Ckfr4sXIh9yKx1GAuNV/62PPr8X0j5I892x/Qvt10=;
 b=IZ/kpz5FcE0TRqS4Mg17l7gLbwVYd6pJf3T6Rh5hWByH+Ih5BAZtC8vfMXVHcHxtwVWvUOV9qiV+lO1zv30i4Yohi/83M/m1oUo55oIcUaXtwkwRiL3/m7cNovXxfudAnHSYFIxd3M5T4xS5UF2/GpQUezv8m/kqlycG0Y3LgHTPUKGgd196d1WjUZLgXEbs30VhwnUe830m/oTEej6rci8B3liLacI07XqbIlQGf+Ffy3LujQhLZmVyVmj/0geZzY3l4g3N8xnuic5arzXfoCCkS6pI3OLVwze42sqaOzooCsWLvyiBxlEN1ksIfvXUlU2R5GgiBDdoW7mH+spDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF69AE895C5.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2b) by CH3PR11MB8589.namprd11.prod.outlook.com
 (2603:10b6:610:1ad::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 12:27:08 +0000
Received: from DS4PPF69AE895C5.namprd11.prod.outlook.com
 ([fe80::515b:588c:c79a:a1fb]) by DS4PPF69AE895C5.namprd11.prod.outlook.com
 ([fe80::515b:588c:c79a:a1fb%8]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 12:27:08 +0000
Date: Tue, 22 Sep 2026 15:27:01 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <alex.zuo@intel.com>
Subject: Re: [PATCH] drm/i915/display: Do not check crtc_state when
 initializing BW limits
Message-ID: <arJ0FUdbC8ed5CuL@ideak-desk.lan>
References: <20260921184617.609564-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260921184617.609564-1-jonathan.cavitt@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GVX0EPF0005F6BB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::645) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF69AE895C5:EE_|CH3PR11MB8589:EE_
X-MS-Office365-Filtering-Correlation-Id: a211b023-18e0-4518-e538-08df18a4d160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: q+CwjdH9hqwxIG9ueD5LT/dyXIr1w/vSa2Cs5b/uSQtnDvRb9CMx1ExW4jICWYrVJl0YjqTBQo0iF5JmKn10jQn/lB7H3230vC8n9f/XM72ABELeMZa7N8vBkUfZjFjwM1X1me4YHYcj0Ftk+cTTL4dYn+3QDq4A5SeXhIGI0NPwUVmtXf08K/wVp6I6p4+4p4gFjEwxVlr4E3oD3yXP7k/v0pevd2a3F+l/6igaOIzoj33xAUSAjqznzMGv3fx2NJGIPnNiu2m43PscCA7/lyjJK3A+LCneMnr5bfH1u21R7e5D4hCN22qWhggXt9rjrewzLUbEicBwrl9rWO774WOdeV1FflOdTUO3ydRJUw7pELg73/7jhylVWmGh2byF7//cDcTE95IRLgsUSt+MkkANgFjnQhC4yD9Q5mwj5ZvBJ8eY7diB9MlngF6XbSVqo9kjdZ5GMx2fEjNBRLv0RDkipa4/tuS3fOg5K0ZlU90QLmVUKioyVGVF+ocJfun7Gze9w5Puof/D2Cn5lY+sBTqyTFukgpWh9xlzsIGfkSYj63xdXRxMsZOfps2XkuMKmlI7LEmR3ORqoh2o2rMXGL6R9dETdGin8Bi40HHWiY7SX+3dN4Cjfq+xZg0WesOYygf32bf5pxVGhklNKVGmG4MnLTQnjNxG1LcNM5LDoLw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69AE895C5.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CcX2KZGgcT9GZiDMDehyVum+0eepPOlA3jKQmM15Tx/Bnw/R6pZATCuvX08T?=
 =?us-ascii?Q?FIRYYQYEprWcyWD4T7swRZn1fSFOyqlS1wk/22wF6zocDyyioGavQ4DTz9Bk?=
 =?us-ascii?Q?x4K5xocA2LOjcrvEVchyo9I+ni8eUbwCqUraSTwf+AGZXEl0WYQDndGbDrj9?=
 =?us-ascii?Q?vsVVhzAfSD6qw/nFXTtRyDY8uXQAfJxzLnsGElixX+QfJJtx7lwpXkdXOIJq?=
 =?us-ascii?Q?IOz72/OBWXGypINyp5lOzteiG4E6yCzrJxMPyQaNVDDAC8tVATgCOdDWzDi1?=
 =?us-ascii?Q?9UH5DbNbVUSAvi423TR5AYXYbtmf1me5nvAo031EwX6hzLPiusGhGHln6DBP?=
 =?us-ascii?Q?1FFAgMaLgyfzONmBbX5dFJDsbDjeeIXJbz+ZYIacExoa52Ojunj7zpp8aT2X?=
 =?us-ascii?Q?bHWsmHljZ/LQaecNdH3aVqw5iyVfzd3lwtgtji+/JorBm8LvU09s9C+C6HhZ?=
 =?us-ascii?Q?j1lT1WbnSFCIOtRYv6biMQ5vd+GFs8AynR9D4a5dMKfB8Td7ZN3X2mWg4vXo?=
 =?us-ascii?Q?pGSlo5adahKXENLbWdJU90Jk+RVMRtium31kwkGc7QCKlhR5sQZFFOI9pAAf?=
 =?us-ascii?Q?Gy++FhxalIgA2SoI8/OpXeIDFDMxB0ZocyaCshfvTRqNobGaFBdYnbvgpd1R?=
 =?us-ascii?Q?sD6eBpJu4PrPJ3dtSxDQcg187LYyYln36yhqVOvpNL4MBHcDS3h6/uTgFxQ6?=
 =?us-ascii?Q?pQFyq183ndOMVZSxwHxJACOMxyWC/rcRuSs1c6Dd73onkhZHwIeOwWOGP1bS?=
 =?us-ascii?Q?7YbwQfC6pi34VIM60PRTSCXwD+wKIe1IhADDaUFjQ1VkYS2TeOhRk4yGhH8c?=
 =?us-ascii?Q?QrDZG36ua+5v4On8WUulG7keAvg88TUeuXXlh5+OY2GBM0I1CHFj2Ws/ONyI?=
 =?us-ascii?Q?E/aELlzjuS3uD800wqDi44yjsFuOOWzxBxIi6wGkgdp6q6336RbnJGgKLB4e?=
 =?us-ascii?Q?YWA6o+KOvMMc8OWEmuFA097N3Sr/ya5fP/OOfmY8wGWMguObxFQ8i5KOXE1x?=
 =?us-ascii?Q?7vLlRrPLNTsG7CuTgvYDsz4aEneZ1MakzbnZuyHRfrlxtnZ3hzCuOSQJYMQk?=
 =?us-ascii?Q?QWxqreveZHAJGLyRKw4y07+/N50auzDstEuJV7jFQFAXU8B9Vj2xBRJDiHfP?=
 =?us-ascii?Q?LxCy2tI9D4VxYrrz8BoyJlvjOKFzW7pE4tVJqWynhwfsClYXrhuXs/eUFu7T?=
 =?us-ascii?Q?LNzPiWuSHfr/u4JWEjKApD1zjr6MKz0W5BQjauJUk88JPQcBM+Vewe7Warkm?=
 =?us-ascii?Q?CiP0K7W8FXw3xy1qJ2jHANmfrOa2UHYw0VqVZ2sBuoYGRD9W6Ak/i5WRz3xX?=
 =?us-ascii?Q?fJojnTiL7UyvKCKlmM7dx3FHyuhkm6XAS8uZG+4sqxofmHEyyX5R8tFsMUo0?=
 =?us-ascii?Q?gVmOWKiRjpnLnLCYIM7aH++CanJObjX66IjQRAWvTIGPydXiB/vMibhiVs5Q?=
 =?us-ascii?Q?YPHGqjtjJlcftw6XLWVqVPNMBry2Vg31G54prdymKd6aeXk2VQcPNteo1XsR?=
 =?us-ascii?Q?pYRswH+dhAnu/pd4oOMT+VLqdCC+wp429kW3TyUoctaDurDRramxbrLmz4Kc?=
 =?us-ascii?Q?2oaZUlXmoPNBeKmbc8e40o6WVDe3E6IhahtJuq6sSK9OVZOHXeKnDHmC82ZD?=
 =?us-ascii?Q?cQ8xWawlNBJWWkRUtTrOzo+qraLMB/Uu4cdwTJLmAMDoxtBf5eVcJCIepgTM?=
 =?us-ascii?Q?2okj9ZADSKqG36zmJNjhBvnWbYd6T1EHSAz2mqgzyJR70FiWrnXY8Hn3vLyC?=
 =?us-ascii?Q?UNESWLDWTg=3D=3D?=
X-Exchange-RoutingPolicyChecked: gWeaRyy13Raab+JF1iqbHjUUX3XJI1ZBfrztkO8RII8V5DTGa450fXsVGKbkvyoO+gIe2KI3jR+ZbCe1OVIpn+cNufIYm/wmeHuotYz5YqUD/TSelaTQdpdttx1LrURGEjFqHiXiPaSt3rIDBdOaJQBElWzhXZ5bc69FIgLfjovu+q4MIFtfs4y6+6cMoaK+5J7bEe2GEg4OqSVN44Y9kxe5OM6mZhPHlQ5NbA+JuWQsDtVj8mQsKYlAgwApSPIVpfrAxZwmFs4rZMXQjiTrlG8KUZZh6d2l0fefTqhuizn+X/aDKEZCyU/kfuce+H+OrK4Znip9Mqvp46QjCDdDDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a211b023-18e0-4518-e538-08df18a4d160
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 12:27:08.4709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +V8h4t1Ww0FT3LqMz5GWD5xIP9bKo6jHq1qm9mO6CfNOqgWh+WDGYfJ/14Rh2bTMsfCFKzSclGGF9oKuZ6mi4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8589
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

On Tue, Sep 22, 2026 at 02:46:17AM +0800, Jonathan Cavitt wrote:
> In intel_link_bw_init_limits, we call intel_atomic_get_new_crtc_state to
> grab an intel_crtc_state pointer.  This pointer is later used to set the
> max_bpp_x16 value for the given pipe.  There is a check here for if the
> return value of the intel_atomic_get_new_crtc_state function returns
> NULL, but this is not checked in any other place where this function is
> used.

The other places using intel_atomic_get_new_crtc_state() can omit the
check, since at those places it's guaranteed that the CRTC state for the
crtc passed to the function is part of the atomic state, hence
intel_atomic_get_new_crtc_state() is guaranteed to return a non-NULL
pointer.

> Removing this check makes the code more consistent and prevents
> confusion from static analyzers.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_link_bw.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.c b/drivers/gpu/drm/i915/display/intel_link_bw.c
> index e71e76d6fd3e0..2a20a12de9e0a 100644
> --- a/drivers/gpu/drm/i915/display/intel_link_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_link_bw.c
> @@ -64,8 +64,7 @@ void intel_link_bw_init_limits(struct intel_atomic_state *state,
>  			intel_atomic_get_new_crtc_state(state, crtc);
>  		int forced_bpp_x16 = get_forced_link_bpp_x16(state, crtc);
>  
> -		if ((state->base.duplicated && crtc_state) ||
> -		    intel_dp_mst_stream_disconnected(state, crtc)) {
> +		if (state->base.duplicated || intel_dp_mst_stream_disconnected(state, crtc)) {

The loop goes through all pipes (i.e. CRTCs) and it's not guaranteed
that all CRTCs are part of the atomic state. Hence the crtc_state==NULL
is required here unless intel_dp_mst_stream_disconnected() returns true,
in which case that return value also guarantees that the CRTC is in the
atomic state and hence crtc_state is guaranteed to be non-NULL.

So the above condition in the existing code is correct.

>  			limits->max_bpp_x16[pipe] = crtc_state->max_link_bpp_x16;
>  			if (intel_dsc_enabled_on_link(crtc_state))
>  				limits->link_dsc_pipes |= BIT(pipe);
> -- 
> 2.53.0
> 
