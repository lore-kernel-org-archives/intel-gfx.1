Return-Path: <SRS0=AXNP=KO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D7AC433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 19 May 2021 06:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ECFB610E9
	for <intel-gfx@archiver.kernel.org>; Wed, 19 May 2021 06:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ECFB610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A776EAD5;
	Wed, 19 May 2021 06:36:16 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4EF6E1B1;
 Wed, 19 May 2021 06:36:14 +0000 (UTC)
IronPort-SDR: P9r+8398rn+OkJ9o4MXpcGrElsxXsYb4s1tSNimhmn1ChL8SoKC0mM8KO8Q+YosZNQIMhApAjl
 1cmMy1bLVEhw==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="200953990"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="200953990"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 23:36:12 -0700
IronPort-SDR: 26FJhG5hKjHpbMUSgRDcfyLkTroVpSa105OceBVvPqSlEtPcgRPJkIMfpdl08K18Nyn5sJFb9M
 9BeadNdkd5eg==
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="473337476"
Received: from akrolak-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.37.74])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 23:36:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20210519004012.GF4589@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210518161705.3697143-1-gregkh@linuxfoundation.org>
 <20210519004012.GF4589@zhen-hp.sh.intel.com>
Date: Wed, 19 May 2021 09:36:05 +0300
Message-ID: <87zgwrdycq.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: remove local storage of
 debugfs file
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 19 May 2021, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>
> Thanks!

Thanks for the review. Please also let Greg know whether he can pick
this up via the debugfs tree; I don't care either way.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
