Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0348606A31C
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2026 13:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=o4m2gz2i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4DE10F347;
	Mon,  9 Nov 2026 13:57:46 +0000 (UTC)
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441810E0EA
 for <intel-gfx@lists.freedesktop.org>; Sun,  8 Nov 2026 22:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail2; t=1794176984; x=1794436184;
 bh=IPQUpb6i+nLFnMLA9a1Elw+H2n4QnL7ADYg7p7un71M=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=o4m2gz2iE2IsQ0rR14YV7ZDkr3CQunOQStHMRqO3VSxVNU1tK5/hhTCNxE/jIvs8p
 LtZuePcdNwl+ZLmWPU61zpdhFII9U80fdPk5FHn/Ed98jwvuY2UcO7h6DSajVgG2k/
 N+xMlczQfKuPoNot/wNHMBhecOi7+MdZ8sOHEV8qIQuM+tqZ31idfpvqqEHxQqfxxS
 e/BYIeU7N+Gs62zwLpstEf72E5SXd/TaBKAS+5ZGbUsz48D0UubmIPAzaJLI3uLcgX
 G4JjrmE3mG3M9M8/zdGx69zz3NJ+baduEhFVW+3s0Nq3DouDMFCd/D2/sSbEyjtbrt
 5SdS+cRLcl2/g==
Date: Sun, 08 Nov 2026 22:29:38 +0000
To: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/i915/bios: validate VBT vswing/preemphasis override table
Message-ID: <40IXMMqFQJJm26J3saK7hx09nF4FuE3ZJcU6gMIryuxuGC5VENrcgA9q4klryPNSLnMwE64szv7eg4wf__gU8OlgzlL8tw3CmV_78Kc_H14=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: f5a919b28448b5cbde6dce3ce891cdedb4a6e049
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Nov 2026 13:57:35 +0000
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Proposed-fix limitation: the patch below does not validate the full
VBT table extent against the section size. The malformed/short-table
out-of-bounds case described below remains unresolved by these
existence and minimum-count checks. This is an incomplete proposal for
maintainer review; a complete fix still needs section-extent bounds
validation.

parse_vswing_preemph_override() stores the raw pointer and count fields
from VBT block 57 without validating that the block actually contains
the announced table, and allocate_vswing_preemph_override() allocates
the consumer structures whenever a child device sets use_vbt_vswing -
even when the block is absent entirely. validate_vspeo() only checks
that devdata->vspeo is non-NULL and that the port has DP.

Two failure modes follow at DDI buffer-translation time:
 - block absent: tables =3D=3D NULL, num_columns =3D=3D 0, so the consumer
   dereferences tables[0] (NULL).
 - block short or malformed: the table walk reads up to
   (5+1)*num_rows*num_columns u32s from a block whose enforced minimum
   size is 2 bytes - with num_columns =3D 255 that is ~98 KB past a small
   heap allocation, and the values are programmed into PHY registers.

The patch gates the consumer on the table existing with sane counts.
A complete fix should also validate the table extent against the
section size, which is not currently plumbed through; happy to rework
if there is a preferred way to carry the section size.

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), drivers/gpu/drm/i915/display/intel_bios.c:2216-2234=
 (parse), 2654-2676 (allocate), 3874-3923 (validate/consume).
Introduced in the v7.4 merge window.

This was found during an assisted (AI-supported) static source review of
mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); e=
very code path cited below was re-verified by the
reporter against that tree. The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

Reported-by: Noah Weinberger <noahweinberger2003@proton.me>
---
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i9=
15/display/intel_bios.c
index 7b6a6f8..d99a675 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2657,7 +2657,8 @@ static void allocate_vswing_preemph_override(struct i=
ntel_bios_encoder_data *dev
 =09union intel_ddi_buf_trans_entry *entries;
 =09struct intel_ddi_buf_trans *vspeo;
=20
-=09if (!intel_bios_encoder_requests_vspeo(devdata))
+=09if (!intel_bios_encoder_requests_vspeo(devdata) ||
+=09    !devdata->display->vbt.vspeo.tables)
 =09=09return;
=20
 =09vspeo =3D kzalloc_obj(*vspeo);
@@ -3876,6 +3877,8 @@ validate_vspeo(const struct intel_bios_encoder_data *=
devdata, bool has_dp)
 {
 =09struct intel_ddi_buf_trans *vspeo;
=20
+=09struct intel_display *display =3D devdata->display;
+
 =09vspeo =3D devdata->vspeo;
 =09if (!vspeo)
 =09=09return false;
@@ -3883,5 +3886,10 @@ validate_vspeo(const struct intel_bios_encoder_data =
*devdata, bool has_dp)
 =09if (!has_dp)
 =09=09return false;
=20
+=09if (!display->vbt.vspeo.tables ||
+=09    display->vbt.vspeo.num_columns < 3 ||
+=09    display->vbt.vspeo.num_tables < 6)
+=09=09return false;
+
 =09return true;
 }

