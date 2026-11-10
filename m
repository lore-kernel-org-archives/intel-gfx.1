Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8475D606A33B
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2026 13:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bBNF9t2F
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FA510F6C4;
	Tue, 10 Nov 2026 13:07:59 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15FB10F6C4
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2026 13:07:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B69C4637B0;
 Tue, 10 Nov 2026 13:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE851F0089F;
 Tue, 10 Nov 2026 13:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794316071;
 bh=Rz/vpL/ZP08C6I3d8Q4WQipN4POIYwU7H5uKutAPTPM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=bBNF9t2FkCIZoc80f6HmeU58zqQrlTkFMIAkPn9M4oKxfH1deLfeT3MYppf2WV19S
 GFM/OjW7VhdVsGtVE0QIZPFuS1nnhwIjfm5zpR/vFdY7rgsJXc4QcQf9t4ucZZmndb
 1N1yTs/0XX+p8zmSfYRsH9cfrZQc3JOGWUY8G33Zd/UdgduCMtG4JnzCwem9QYpERv
 Z5JGP3Owj3QHIBL287f0/W9S8bcSyhZmhLfoPtPKOBUCz3dptplqIQLK7IDgam8MGf
 pkMdzGZK71AbN7DQ/RIT6eOmjV59x/sRB6q22wg2Uv/welpcSEOuolshSHCSaHthrX
 aY8MPnIKblKYA==
Message-ID: <sashiko-outbox-207084@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/i915/guc: Don't unblock a banned context
To: "Javier MV" <javiermv@gmail.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20261110122534.12989-3-javiermv@gmail.com>
References: <20261110122534.12989-1-javiermv@gmail.com>
 <20261110122534.12989-3-javiermv@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 13:07:50 +0000
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/i915/guc: context_cant_unblock() misses exiting contexts
  on unblock
--

commit f3c1b0cc59baf35aaa07862b720ef5529fd5baed
Author: Javier MV <javiermv@duck.com>

drm/i915/guc: Don't unblock a banned context

This commit adds an intel_context_is_banned() check to
context_cant_unblock() so that guc_context_unblock() does not re-enable
scheduling on a banned context after the schedule-disable done handler
clears SCHED_STATE_BANNED.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15301

> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/=
gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 555ca8fdf64af..eb1d010ed3dcc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3182,7 +3182,12 @@ static bool context_cant_unblock(struct intel_cont=
ext *ce)
>  {
>  	lockdep_assert_held(&ce->guc_state.lock);
> =20
> +	/*
> +	 * SCHED_STATE_BANNED alone isn't enough: the sched disable done
> +	 * handler clears it.
> +	 */
>  	return (ce->guc_state.sched_state & SCHED_STATE_NO_UNBLOCK) ||
> +		intel_context_is_banned(ce) ||
>  		context_guc_id_invalid(ce) ||
>  		!ctx_id_mapped(ce_to_guc(ce), ce->guc_id.id) ||
>  		!intel_context_is_pinned(ce);

[Severity: Medium]
Should this check !intel_context_is_schedulable(ce) instead of
intel_context_is_banned(ce)?

intel_context_revoke() sets CONTEXT_EXITING (not CONTEXT_BANNED) via
intel_context_set_exiting() before calling guc_context_revoke(), which
then takes the same SCHED_STATE_BANNED path as a banned context.  If
intel_context_revoke() (for example on context close or process exit for
a non-persistent context) races with guc_context_cancel_request() while
the block schedule-disable is pending, intel_guc_sched_done_process_msg()
clears SCHED_STATE_BANNED and cancels the inflight requests with -EIO.

When guc_context_cancel_request() resumes, guc_reset_state() sees
!intel_context_is_schedulable(ce) and returns early without scrubbing the
LRC or advancing the ring head, and then guc_context_unblock() re-enables
scheduling in GuC for the revoked context with an un-scrubbed ring and
already-completed requests.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110122534.1298=
9-1-javiermv@gmail.com?part=3D2
