Return-Path: <SRS0=RNxq=D6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC26C388F9
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Oct 2020 23:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 471CF20791
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Oct 2020 23:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 471CF20791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06F56E073;
	Fri, 23 Oct 2020 23:55:19 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C4E6E073
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2020 23:55:17 +0000 (UTC)
IronPort-SDR: mVb6KlUmAVV5yYjlMrvXMbW7s3Orrc5sgmHbBvkDN9BAqPAiDe9vtERxc468tX/zd4A1fpSvPp
 dKkrkRInRfeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9783"; a="252441789"
X-IronPort-AV: E=Sophos;i="5.77,410,1596524400"; d="scan'208";a="252441789"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 16:55:17 -0700
IronPort-SDR: LnbJG03Ka4fXUX4T9eLuTTNKHN8PTsHiSkt9bj/FH9Stq6mg5L2teONNaCRpc8muqDSViNZwzN
 0mFcaPvGb+8A==
X-IronPort-AV: E=Sophos;i="5.77,410,1596524400"; d="scan'208";a="360381685"
Received: from ldmartin-desk1.jf.intel.com (HELO ldmartin-desk1)
 ([10.24.14.56])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 16:55:17 -0700
Date: Fri, 23 Oct 2020 16:55:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <20201023235516.rivfrun42xt5npnf@ldmartin-desk1>
X-Patchwork-Hint: comment
References: <20200716172106.2656-1-ville.syrjala@linux.intel.com>
 <20200716172106.2656-14-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716172106.2656-14-ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 13/14] drm/i915: Sort ICL PCI IDs
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

On Thu, Jul 16, 2020 at 08:21:05PM +0300, Ville Syrj=E4l=E4 wrote:
>From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>
>Sort the ICL PCI IDs numerically. Some order seems better than
>randomness.

At one point there was actually logic in the order: it followed whatever
order the spec had, so "updating the IDs" was basically rewriting
those defines or quickly scan through the spec and what we had in the
driver.

Of course, that doesn't work so well, because a) the order may change in
the spec and in fact it did; b)  with the split between variants of the
same platform it adds randomness to it; c) not everybody understands
what order was supposed to be and just appends to the end

So, I think a comment on top saying the PCI IDs should be lowercase and
numerically sorted would be appropriate to avoid having to fix this
again soon.

Lucas De Marchi

>
>Cc: Alexei Podtelezhnikov <apodtele@gmail.com>
>Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>---
> include/drm/i915_pciids.h | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>
>diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
>index 33a72e6eadd8..45da1b45c01e 100644
>--- a/include/drm/i915_pciids.h
>+++ b/include/drm/i915_pciids.h
>@@ -564,18 +564,18 @@
> /* ICL */
> #define INTEL_ICL_PORT_F_IDS(info) \
> 	INTEL_VGA_DEVICE(0x8A50, info), \
>-	INTEL_VGA_DEVICE(0x8A5C, info), \
>-	INTEL_VGA_DEVICE(0x8A59, info),	\
>-	INTEL_VGA_DEVICE(0x8A58, info),	\
> 	INTEL_VGA_DEVICE(0x8A52, info), \
>+	INTEL_VGA_DEVICE(0x8A53, info), \
>+	INTEL_VGA_DEVICE(0x8A54, info), \
>+	INTEL_VGA_DEVICE(0x8A56, info), \
>+	INTEL_VGA_DEVICE(0x8A57, info), \
>+	INTEL_VGA_DEVICE(0x8A58, info),	\
>+	INTEL_VGA_DEVICE(0x8A59, info),	\
> 	INTEL_VGA_DEVICE(0x8A5A, info), \
> 	INTEL_VGA_DEVICE(0x8A5B, info), \
>-	INTEL_VGA_DEVICE(0x8A57, info), \
>-	INTEL_VGA_DEVICE(0x8A56, info), \
>-	INTEL_VGA_DEVICE(0x8A71, info), \
>+	INTEL_VGA_DEVICE(0x8A5C, info), \
> 	INTEL_VGA_DEVICE(0x8A70, info), \
>-	INTEL_VGA_DEVICE(0x8A53, info), \
>-	INTEL_VGA_DEVICE(0x8A54, info)
>+	INTEL_VGA_DEVICE(0x8A71, info)
>
> #define INTEL_ICL_11_IDS(info) \
> 	INTEL_ICL_PORT_F_IDS(info), \
>-- =

>2.26.2
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
