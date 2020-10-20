Return-Path: <SRS0=qNAp=D3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975EAC433E7
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 12:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8E0C20BED
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2020 12:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8E0C20BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5818C6EC5C;
	Tue, 20 Oct 2020 12:10:12 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF196EC5C
 for <Intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2020 12:10:10 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22766692-1500050 for multiple; Tue, 20 Oct 2020 13:10:04 +0100
MIME-Version: 1.0
In-Reply-To: <160319519741.15830.12777651851324275501@build.alporthouse.com>
References: <20201020100822.543332-1-tvrtko.ursulin@linux.intel.com>
 <20201020100822.543332-2-tvrtko.ursulin@linux.intel.com>
 <160319519741.15830.12777651851324275501@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Tue, 20 Oct 2020 13:10:02 +0100
Message-ID: <160319580270.15830.9644634406956362493@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/pmu: Fix CPU hotplug with
 multiple GPUs
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Chris Wilson (2020-10-20 12:59:57)
> Quoting Tvrtko Ursulin (2020-10-20 11:08:22)
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Since we keep a driver global mask of online CPUs and base the decision
> > whether PMU needs to be migrated upon it, we need to make sure the
> > migration is done for all registered PMUs (so GPUs).
> > 
> > To do this we need to track the current CPU for each PMU and base the
> > decision on whether to migrate on a comparison between global and local
> > state.
> > 
> > At the same time, since dynamic CPU hotplug notification slots are a
> > scarce resource and given how we already register the multi instance type
> > state, we can and should add multiple instance of the i915 PMU to this
> > same state and not allocate a new one for every GPU.
> > 
> > v2:
> >  * Use pr_notice. (Chris)
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Suggested-by: Daniel Vetter <daniel.vetter@intel.com> # dynamic slot optimisation
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  drivers/gpu/drm/i915/i915_pci.c |  7 ++++-
> >  drivers/gpu/drm/i915/i915_pmu.c | 50 ++++++++++++++++++++-------------
> >  drivers/gpu/drm/i915/i915_pmu.h |  6 +++-
> >  3 files changed, 41 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> > index 27964ac0638a..a384f51c91c1 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -1150,9 +1150,13 @@ static int __init i915_init(void)
> >                 return 0;
> >         }
> >  
> > +       i915_pmu_init();
> > +
> >         err = pci_register_driver(&i915_pci_driver);
> > -       if (err)
> > +       if (err) {
> > +               i915_pmu_exit();
> >                 return err;
> > +       }
> >  
> >         i915_perf_sysctl_register();
> >         return 0;
> > @@ -1166,6 +1170,7 @@ static void __exit i915_exit(void)
> >         i915_perf_sysctl_unregister();
> >         pci_unregister_driver(&i915_pci_driver);
> >         i915_globals_exit();
> > +       i915_pmu_exit();
> >  }
> >  
> >  module_init(i915_init);
> > diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> > index 51ed7d0efcdc..0d6c0945621e 100644
> > --- a/drivers/gpu/drm/i915/i915_pmu.c
> > +++ b/drivers/gpu/drm/i915/i915_pmu.c
> > @@ -30,6 +30,7 @@
> >  #define ENGINE_SAMPLE_BITS (1 << I915_PMU_SAMPLE_BITS)
> >  
> >  static cpumask_t i915_pmu_cpumask;
> > +static unsigned int i915_pmu_target_cpu = -1;
> >  
> >  static u8 engine_config_sample(u64 config)
> >  {
> > @@ -1049,25 +1050,32 @@ static int i915_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
> >  static int i915_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
> >  {
> >         struct i915_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> > -       unsigned int target;
> > +       unsigned int target = i915_pmu_target_cpu;
> 
> So we still have multiple callbacks, one per pmu. But each callback is
> now stored in a list from the cpuhp_slot instead of each callback having
> its own slot.
> 
> >  
> >         GEM_BUG_ON(!pmu->base.event_init);
> >  
> >         if (cpumask_test_and_clear_cpu(cpu, &i915_pmu_cpumask)) {
> 
> On first callback...
> 
> >                 target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
> 
> Pick any other cpu.
> 
> > +
> >                 /* Migrate events if there is a valid target */
> >                 if (target < nr_cpu_ids) {
> >                         cpumask_set_cpu(target, &i915_pmu_cpumask);
> > -                       perf_pmu_migrate_context(&pmu->base, cpu, target);
> > +                       i915_pmu_target_cpu = target;
> 
> Store target for all callbacks.
> 
> >                 }
> >         }
> >  
> > +       if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
> 
> If global [i915_pmu_target_cpu] target has changed, update perf.
> 
> > +               perf_pmu_migrate_context(&pmu->base, cpu, target);
> > +               pmu->cpuhp.cpu = target;
> 
> It is claimed that cpuhp_state_remove_instance() will call the offline
> callback for all online cpus... Do we need a pmu->base.state != STOPPED
> guard?

s/claimed/it definitely does :)/

Or rather pmu->closed.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
