Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB91C5DF60
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDF710F0CE;
	Wed, 12 Aug 2026 17:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="soG7B3ud";
	dkim-atps=neutral
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B449110EE1C
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Aug 2026 03:58:42 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-92e7c6ec9dbso15008985a.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 11 Aug 2026 20:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786507121; x=1787111921; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=p1ustWcvblwbfs6YObNVhPj8bLhBv9z4SEr4Hg478cA=;
 b=soG7B3udEJuKgi3fgtyJcUU7J2Z1k3sS+UkUCsOp4zSqCWem7ml9qt+40aJsjjBnd2
 EbM6dV2SJEKrZcwn83Lh/XD2z7UIwjSTX1ped9OABprRjcocJnVXEXlDgjROMsRjJkGa
 FcbbnjebjUgxZ7fARin6DnnPB5MT87oa3wA2j0gX0xH2NhZbECK8KVzFQSdGSRY3Hcuh
 m/u+RV5CkwrsibsMGc5y3WzRYB3g4rjj/NwnY1hS6+wv4glE2QmI9NjDy1DS0BYKVGYM
 CyAAMpqbtoQ6hlJFZyEv1D1a0BPVLZqBt4krvKwW/e6tYN6ZHrlxcOJQZHFpAj3wPltB
 j/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786507121; x=1787111921;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=p1ustWcvblwbfs6YObNVhPj8bLhBv9z4SEr4Hg478cA=;
 b=TRQsPt5cV5XeOnPvM3O6we4VakyLLXaXtwEnZ1yo7fgRlwtE2ZHMEJ7rzs2Ol+3kXH
 ehlM/RBIrBh1nEM+xbnwmZ45rrpReSv4CcKEUayt5PTlZun6RYk4RJq/alGBttnAKINM
 GNzXynS412SHWZQlXnjJ8o/qzrHm9IlQJQnIRi3+OqXeU0uwOtzgGl/9YQqhBreGtyaa
 CfSG9SzESBGMBAl5kmkYI7VNdQqEy9CHZO6gEH1GSfh9aOG5Wv+uGtAJDkhNPCHI5TJy
 qqbC/hG2C9OYLCz8rnN7HinS/jZRAWmzrLRMLok/NdM10gII94DPOpLtrSBfhcn+xgaj
 /faQ==
X-Gm-Message-State: AOJu0Ywjw12PinrmrsFoZvXzR3N6b+RaD6TpaYuUxZdetGv7Q8IqSXvU
 GHWiD7eMkTrss6bW1ylVKMvuxMO195/zlEF+S0D7bKeq9eu+0lIsn9mr
X-Gm-Gg: AR+sD13J45cYJJSZC9ams5AnoIdewO7q3DAQL7WmMgX2p2m+6Kwe7sj8QynWJfCZ94J
 z/I9N5TJAFypLd1S8MWnoza+elSk8g9oGNpBcntpTPaVyL6iwF7LkTUbMYcDRyDIsU0oYyMFqt0
 6ko068Ry09CgsMi25ILMnzAFBIZqkM63pWSFH9w9+UqTnFMG25kMqGVsY4bZQreR8uO+U73sb/M
 rvJphkd0/SMVeqqoBfuEpGVrc9TvBXsbMB57TQipfQj5CKv26lUBbKHj7tNw4XsNiAB9q4/CwhB
 vw+8fsGd4RclVFDUHw5dLxxPyCxn02FDcGYI4gEY7ZhhEnqwZ9s6XXzrz6mmurmP3uGFx8FoNi1
 InxL6x//7as9iHWGRADKCnW0BadmQ+ufQ6jAiSqXATprFXRjGa+EVUd0VHtOxPfQUhMyM9bb+Eg
 Im70SG1OYrjUEFFqpuqwbE9F4fPqpsjcocu5WgN2kXWwom2Lz7mkxBN4WP9P4bCbLjv7enmLRd4
 KQHxus4hrTO88o6/p6nejc9fVNy5VJG
X-Received: by 2002:a05:620a:6912:b0:92e:e2f4:e652 with SMTP id
 af79cd13be357-936b3a44f20mr220782485a.16.1786507121508; 
 Tue, 11 Aug 2026 20:58:41 -0700 (PDT)
Received: from smtpclient.apple ([2600:1016:b10f:b114:6c29:917c:9735:8846])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-936b5f64f8esm35682885a.46.2026.08.11.20.58.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Aug 2026 20:58:41 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] drm/i915/gt: Fix request use-after-free in heartbeat()
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <yzfnzbtsqjvk4y6vhn7uvdrzew5hqzfo4khdsx226ppqdjgm4q@xzysjj4fwcwz>
Date: Tue, 11 Aug 2026 23:58:09 -0400
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1734D14C-BCE0-4B86-8FD4-C1A989AC629B@gmail.com>
References: <20260808184302.1509585-1-shuangpeng.kernel@gmail.com>
 <yzfnzbtsqjvk4y6vhn7uvdrzew5hqzfo4khdsx226ppqdjgm4q@xzysjj4fwcwz>
To: Krzysztof Karas <krzysztof.karas@intel.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:47 +0000
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

> On Aug 11, 2026, at 06:50, Krzysztof Karas <krzysztof.karas@intel.com> =
wrote:
>=20
> Hi Shuangpeng,
>=20
> On 2026-08-08 at 14:43:02 -0400, Shuangpeng Bai wrote:
>> heartbeat() detaches engine->heartbeat.systole with xchg() before
>> checking whether the request has completed. If the request is =
complete,
>> dropping the detached systole reference may free it. Concurrently,
>> idle_pulse() can observe the empty slot and publish a newer request.
>>=20
>> The worker then sees a non-NULL engine->heartbeat.systole, but =
continues
>> to dereference its stale local rq. The newer request can therefore =
make
>> the shared-slot check succeed after the old request has been freed,
>> causing use-after-free accesses to emitted_jiffies, submit, and =
sched.
>>=20
>> If the detached request is incomplete, heartbeat() can also overwrite =
a
>> newer request published by idle_pulse() when it unconditionally =
restores
>> the old pointer.
>>=20
>> Use cmpxchg() both when idle_pulse() publishes a request and when
>> heartbeat() restores the detached request. Drop the detached =
reference
>> when restoration loses the race, and reload rq from the shared slot
>> before dereferencing it.
>>=20
>> A KASAN-enabled i915 mock selftest reproduces the use-after-free =
before
>> this change and completes without a report after the fix.
> What is this mock selftest? Can I see it somewhere and confirm
> if it works myself? A link to a public issue would be cool too,
> something that gives more context as to how this was discovered.
>=20

Hi Krzysztof,

I've put the reproducer here:

https://gist.github.com/shuangpengbai/1410664bc909e8c834311576d6242103

Tested on commit a59f57e2aa127c5354168d2ec4bac920df1be4f4 (2026-08-07).

It uses i915's mock selftest path, so no Intel GPU hardware is required.=20=

Please apply 1_repro.patch, build with 2_config, and boot with:
i915.mock_selftests=3D1 i915.igt__36__mock_heartbeat_uaf=3D1

Expected result:
BUG: KASAN: slab-use-after-free in heartbeat

Best,
Shuangpeng

>>=20
>> Fixes: bf9bd6a5128a ("drm/i915/gt: Track the most recent pulse for =
the heartbeat")
>> Cc: stable@vger.kernel.org # v5.11+
>> Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
>> ---
>> .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 22 =
++++++++++++++-----
>> 1 file changed, 16 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c =
b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> index 6424ecce8bcb..fc6c53c93cf5 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> @@ -81,10 +81,18 @@ heartbeat_create(struct intel_context *ce, gfp_t =
gfp)
>>=20
>> static void idle_pulse(struct intel_engine_cs *engine, struct =
i915_request *rq)
>> {
>> + struct i915_request *systole;
>> +
>> engine->wakeref_serial =3D READ_ONCE(engine->serial) + 1;
>> i915_request_add_active_barriers(rq);
>> - if (!engine->heartbeat.systole && =
intel_engine_has_heartbeat(engine))
>> - engine->heartbeat.systole =3D i915_request_get(rq);
>> + if (READ_ONCE(engine->heartbeat.systole) ||
>> +     !intel_engine_has_heartbeat(engine))
>> + return;
>> +
>> + systole =3D i915_request_get(rq);
>> + /* The worker may have restored its detached systole in the =
meantime. */
>> + if (cmpxchg(&engine->heartbeat.systole, NULL, systole))
>> + i915_request_put(systole);
>> }
>>=20
>> static void heartbeat_commit(struct i915_request *rq,
>> @@ -152,9 +160,11 @@ static void heartbeat(struct work_struct *wrk)
>> if (rq) {
>> if (i915_request_completed(rq))
>> i915_request_put(rq);
>> - else
>> - engine->heartbeat.systole =3D rq;
>> + /* Keep a newer pulse that raced with the detached systole. */
>> + else if (cmpxchg(&engine->heartbeat.systole, NULL, rq))
>> + i915_request_put(rq);
>> }
>> + rq =3D READ_ONCE(engine->heartbeat.systole);
>>=20
>> if (!intel_engine_pm_get_if_awake(engine))
>> return;
>> @@ -163,11 +173,11 @@ static void heartbeat(struct work_struct *wrk)
>> goto out;
>>=20
>> if (i915_sched_engine_disabled(engine->sched_engine)) {
>> - reset_engine(engine, engine->heartbeat.systole);
>> + reset_engine(engine, rq);
>> goto out;
>> }
>>=20
>> - if (engine->heartbeat.systole) {
>> + if (rq) {
>> long delay =3D READ_ONCE(engine->props.heartbeat_interval_ms);
>>=20
>> /* Safeguard against too-fast worker invocations */
>>=20
>> base-commit: a59f57e2aa127c5354168d2ec4bac920df1be4f4
>> --=20
>> 2.43.0
>>=20
>=20
> The fix looks sane at first glance to me, but I'd like to see
> how it was spotted before diving in further.
>=20
> --=20
> Best Regards,
> Krzysztof


