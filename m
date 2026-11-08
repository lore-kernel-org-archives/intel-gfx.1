Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF3C606A320
	for <intel-gfx@archiver.kernel.org>; Sun,  8 Nov 2026 22:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OWJLQVD6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D8D10ECCE;
	Sun,  8 Nov 2026 22:46:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410BF10ECCE
 for <intel-gfx@lists.freedesktop.org>; Sun,  8 Nov 2026 22:46:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 52F3360D41;
 Sun,  8 Nov 2026 22:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2AE41F0089F;
 Sun,  8 Nov 2026 22:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794177977;
 bh=koNDwtS4PZ6OSz7cYRYwq20T6DmfsZSifaXutd/uLhE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=OWJLQVD6mg2zTryc0/KTC8ptChN0fHbqOBVIoSpvleJth8ho9NTLwCFWqH3jLZAwC
 ezUlIgtg80xLrb05hJTS8HKOJ7qK9XkLXqUrq7p9hL2zzZvraCCMHbrR6jgbIbKfy1
 P92SGwLIUWgVxOZpTnJzKk1GPZ+egGSuxKi2EtA63ih1K0zlFFH0GGstQqZp/CcFar
 83/ubk02vSsORQdQewnLDiqpOrkXAb9hgNSi7QMCYwM/aYqzM/bP/FjoaAzThf2GhF
 8/7MDJjBGnWNr71rcoUg7sl6XYAc43WGgklB3JoZqg8iDemznx+3T4usauTUSOWumK
 gDIR2oW9VCfyg==
Message-ID: <sashiko-outbox-204131@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/bios: validate VBT vswing/preemphasis override
 table
To: "Noah Weinberger" <NoahWeinberger2003@proton.me>
Cc: =?utf-8?b?aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw==?=
 <intel-gfx@lists.freedesktop.org>
In-Reply-To: <40IXMMqFQJJm26J3saK7hx09nF4FuE3ZJcU6gMIryuxuGC5VENrcgA9q4klryPNSLnMwE64szv7eg4wf__gU8OlgzlL8tw3CmV_78Kc_H14=@proton.me>
References: <40IXMMqFQJJm26J3saK7hx09nF4FuE3ZJcU6gMIryuxuGC5VENrcgA9q4klryPNSLnMwE64szv7eg4wf__gU8OlgzlL8tw3CmV_78Kc_H14=@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 22:46:16 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] drm/i915/bios: missing BDB block size check in
  parse_vswing_preemph_override()
- [Medium] drm/i915/bios: out-of-bounds read in combo PHY vspeo due to
  validate_vspeo()
- [Medium] drm/i915/bios: validate_vspeo() rejects valid C10 and combo
  PHY VBT tables
- [Low] drm/i915/bios: missing Fixes/Signed-off-by trailers and
  inaccurate changelog
--

commit e60dd76fbe3fb6893876e4ed2f372a4da1a69f33
Author: Noah Weinberger <NoahWeinberger2003@proton.me>

> drm/i915/bios: validate VBT vswing/preemphasis override table
>=20
> Hello,
>=20
> Proposed-fix limitation: the patch below does not validate the full
> VBT table extent against the section size. The malformed/short-table
> out-of-bounds case described below remains unresolved by these
> existence and minimum-count checks. This is an incomplete proposal for
> maintainer review; a complete fix still needs section-extent bounds
> validation.
>=20
> parse_vswing_preemph_override() stores the raw pointer and count fields
> from VBT block 57 without validating that the block actually contains
> the announced table, and allocate_vswing_preemph_override() allocates
> the consumer structures whenever a child device sets use_vbt_vswing -
> even when the block is absent entirely. validate_vspeo() only checks
> that devdata->vspeo is non-NULL and that the port has DP.
>=20
> Two failure modes follow at DDI buffer-translation time:
>  - block absent: tables =3D=3D NULL, num_columns =3D=3D 0, so the consumer
>    dereferences tables[0] (NULL).
>  - block short or malformed: the table walk reads up to
>    (5+1)*num_rows*num_columns u32s from a block whose enforced minimum
>    size is 2 bytes - with num_columns =3D 255 that is ~98 KB past a small
>    heap allocation, and the values are programmed into PHY registers.
>=20
> The patch gates the consumer on the table existing with sane counts.
> A complete fix should also validate the table extent against the
> section size, which is not currently plumbed through; happy to rework
> if there is a preferred way to carry the section size.
>=20
> Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670b=
d (v7.4-rc1, 2026-11-07), drivers/gpu/drm/i915/display/intel_bios.c:2216-22=
34 (parse), 2654-2676 (allocate), 3874-3923 (validate/consume).
> Introduced in the v7.4 merge window.
>=20
> This was found during an assisted (AI-supported) static source review of
> mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07);=
 every code path cited below was re-verified by the
> reporter against that tree. The patch below has NOT been compiled and has
> NOT been runtime tested, and no reproducer was produced - the triggering
> conditions are described above instead. Please treat this as a report for
> verification rather than a battle-tested fix.
>=20
> Reported-by: Noah Weinberger <noahweinberger2003@proton.me>

[Severity: Low]
This commit fixes bugs in VBT block 57 handling, so it needs a
Signed-off-by: trailer and Fixes: tags for the introducing commits:

  Fixes: a138a81d7805 ("drm/i915/bios: de/allocate VS/PE-O buffers for each=
 port")
  Fixes: e8fe5008ae3d ("drm/i915: override Snps's VS/PE when requested")
  Fixes: 7fdf86e530c7 ("drm/i915: override Combo's VS/PE when requested")

The greeting and testing disclaimers also belong below the "---" separator
rather than in the changelog.

In addition, is the description of the absent-block failure mode accurate?
When block 57 is absent, parse_vswing_preemph_override() returns before
initializing display->vbt.vspeo.num_rows, so num_rows is 0; the loops in
intel_bios_get_*_vspeo() do not iterate or dereference tables[0], and
instead allocate_vswing_preemph_override() passes 0 to kzalloc_objs(),
leaving devdata->entries set to ZERO_SIZE_PTR for callers to dereference.

Finally, in validate_vspeo(), the blank line between the local variable
declarations of vspeo and display is unneeded, and the
!display->vbt.vspeo.tables check is redundant once
allocate_vswing_preemph_override() skips allocating devdata->vspeo when
tables is NULL.

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index 7b6a6f8c3cf19..d99a6756d68be 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c

[ ... ]

> @@ -3883,6 +3886,11 @@ validate_vspeo(const struct intel_bios_encoder_dat=
a *devdata, bool has_dp)
>  	if (!has_dp)
>  		return false;
> =20
> +	if (!display->vbt.vspeo.tables ||

[Severity: Medium]
Can parse_vswing_preemph_override() validate the section size directly
with get_blocksize(block) before populating display->vbt.vspeo?

Whenever BDB_VSWING_PREEMPH is present, block->tables is a non-NULL
flexible array address inside the block allocation, whose enforced minimum
size in bdb_blocks[] is only 2 bytes.  If a malformed or truncated VBT has
num_columns >=3D 3 and num_tables >=3D 6 with a smaller payload,
intel_bios_get_*_vspeo() will still read up to 6 * 16 * 255 * sizeof(u32)
bytes past the heap buffer and program arbitrary slab memory into PHY
registers.

get_blocksize() is already available in intel_bios.c for any pointer
returned by bdb_find_section():

drivers/gpu/drm/i915/display/intel_bios.c:get_blocksize() {
static u32 get_blocksize(const void *block_data)
{
	return _get_blocksize(block_data - 3);
}
}

Checking get_blocksize(block) against struct_size(block, tables,
size_mul(num_rows, size_mul(block->num_tables, block->num_columns))) in
parse_vswing_preemph_override() would prevent out-of-bounds reads without
needing extra plumbing.

> +	    display->vbt.vspeo.num_columns < 3 ||

[Severity: Medium]
Does checking only num_columns < 3 allow out-of-bounds reads in
intel_bios_get_ehl_combo_vspeo() and intel_bios_get_jsl_combo_vspeo()?

While C10 and C20 PHYs read 3 columns per row, both combo PHY helpers read
5 columns per row after calling validate_vspeo():

drivers/gpu/drm/i915/display/intel_bios.c:intel_bios_get_ehl_combo_vspeo() {
	for (level =3D 0; level < num_rows; level++) {
		u32 dw2_swing_sel =3D tables[offset];
		u32 dw7_n_scalar =3D tables[offset + 1];
		u32 dw4_cursor_coeff =3D tables[offset + 2];
		u32 dw4_post_cursor_2 =3D tables[offset + 3];
		u32 dw4_post_cursor_1 =3D tables[offset + 4];
    ...
		offset +=3D num_columns;
	}
}

If VBT block 57 specifies num_columns as 3 or 4 on Elkhart Lake or Jasper
Lake, validate_vspeo() succeeds, and the combo PHY loop reads across row
boundaries on every level and up to 2 u32 entries past the end of the
selected table on the last row.  Passing the required column count into
validate_vspeo() (5 for combo PHY, 3 for C10/C20) would catch this.

> +	    display->vbt.vspeo.num_tables < 6)
> +		return false;

[Severity: Medium]
Doesn't requiring num_tables >=3D 6 for all callers introduce a regression
on C10, EHL, and JSL platforms whose VBT block 57 has fewer than 6 tables?

Only intel_bios_get_c20_vspeo() indexes tables 4 and 5;
intel_bios_get_c10_vspeo() only uses table indices 0 through 3, and
intel_bios_get_ehl_combo_vspeo() and intel_bios_get_jsl_combo_vspeo() only
use indices 0 through 2.  Passing the selected table index idx into
validate_vspeo() and checking idx >=3D display->vbt.vspeo.num_tables would
avoid rejecting valid non-C20 VBT override tables.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/40IXMMqFQJJm26J3saK=
7hx09nF4FuE3ZJcU6gMIryuxuGC5VENrcgA9q4klryPNSLnMwE64szv7eg4wf__gU8OlgzlL8tw=
3CmV_78Kc_H14=3D@proton.me?part=3D1
