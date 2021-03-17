Return-Path: <SRS0=PXPa=IP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC27C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Mar 2021 19:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B37A64E98
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Mar 2021 19:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B37A64E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4066E842;
	Wed, 17 Mar 2021 19:32:11 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2A66E842
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Mar 2021 19:32:09 +0000 (UTC)
IronPort-SDR: Wk8K075jKv5DQxPPYq2qy5P2zn0I2bJx8m1Bh/Ne00nIEm9C43o5XY817Ltj3xhB8u1dpNJnIl
 DvlPQSeFJ71g==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="189625980"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="189625980"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 12:32:08 -0700
IronPort-SDR: ZWG93Rcr2OUCNVUxUetCM5rFWmUEyKEAIh7kYcq6wb/HdKjLS6mp7qVm7yiKSqkvDkD+S2WBA6
 AvDnLiFDVxJg==
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="602357547"
Received: from jksalasr-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.42.17])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 12:32:08 -0700
Date: Wed, 17 Mar 2021 12:32:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20210317193207.xpdiucxnym7rje2r@ldmartin-desk2>
References: <cover.1615998927.git.jani.nikula@intel.com>
 <026b737b122273d256f4247e9b0c84529aa391fd.1615998927.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <026b737b122273d256f4247e9b0c84529aa391fd.1615998927.git.jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 09/14] drm/i915/bios: add i915
 backpointer to intel_bios_encoder_data
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
Cc: intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 06:36:48PM +0200, Jani Nikula wrote:
>We'll be needing it in the future.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_bios.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i=
915/display/intel_bios.c
>index 7379cbb6c419..40fd60acd548 100644
>--- a/drivers/gpu/drm/i915/display/intel_bios.c
>+++ b/drivers/gpu/drm/i915/display/intel_bios.c
>@@ -60,6 +60,8 @@
>
> /* Wrapper for VBT child device config */
> struct intel_bios_encoder_data {
>+	struct drm_i915_private *i915;
>+
> 	struct child_device_config child;
> 	struct dsc_compression_parameters_entry *dsc;
> 	struct list_head node;
>@@ -2026,6 +2028,8 @@ parse_general_definitions(struct drm_i915_private *i=
915,
> 		if (!devdata)
> 			break;
>
>+		devdata->i915 =3D i915;
>+
> 		/*
> 		 * Copy as much as we know (sizeof) and is available
> 		 * (child_dev_size) of the child device config. Accessing the
>@@ -2103,6 +2107,7 @@ init_vbt_missing_defaults(struct drm_i915_private *i=
915)
> 		if (!devdata)
> 			break;
>
>+		devdata->i915 =3D i915;

maybe in the next common field it's time to introduce a _alloc()
function


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> 		child =3D &devdata->child;
>
> 		if (port =3D=3D PORT_F)
>-- =

>2.20.1
>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
